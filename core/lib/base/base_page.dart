import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';
import 'package:core/base/base_view_model.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/localizations/localized_message_resolver.dart';
import 'package:core/localizations/message_resolver.dart';
import 'package:core/localizations/static_message_resolver.dart';
import 'package:di/configure_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<ViewModel extends BaseViewModel<ViewState>,
    ViewState extends BaseState> extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: _onCreateBlocProvider,
      child: BlocListener<ViewModel, ViewState>(
        listener: _listener,
        child: Builder(
          builder: (BuildContext context) {
            return AnnotatedRegion(
              value: systemUiOverlayStyle ??
                  context.theme.appBarTheme.systemOverlayStyle ??
                  SystemUiOverlayStyle(
                    statusBarColor: statusBarColor(context),
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                  ),
              child: Material(
                color: Colors.transparent,
                child: Scaffold(
                  backgroundColor: pageBackgroundColor(context),
                  key: GlobalKey<ScaffoldState>(),
                  appBar: appBar(context),
                  floatingActionButton: floatingActionButton(context),
                  bottomNavigationBar: bottomNavigationBar(context),
                  drawer: drawer(context),
                  bottomSheet: _bottomSheet(context),
                  body: SafeArea(
                    top: useTopSafeArea,
                    bottom: useBottomSafeArea,
                    child: GestureDetector(
                      onTap: _onTapGestureDetector,
                      child: body(context),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ViewModel _onCreateBlocProvider(BuildContext context) {
    ViewModel viewModel = getIt<ViewModel>();
    viewModel.onCreated();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.onViewReady();
    });

    return viewModel;
  }

  void _listener(BuildContext context, ViewState state) {
    if (state.status is SuccessMessageStatus) {
      _showSuccessMessage(
        context,
        _extractMessageFromMessageProvider(
          context,
          state.status!.messageResolver,
        ),
      );
    } else if (state.status is ErrorMessageStatus) {
      _showErrorMessage(
        context,
        _extractMessageFromMessageProvider(
          context,
          state.status!.messageResolver,
        ),
      );
    } else if (state.status is WarningMessageStatus) {
      _showWarningMessage(
        context,
        _extractMessageFromMessageProvider(
          context,
          state.status!.messageResolver,
        ),
      );
    } else {
      handleStateChange(context, state);
    }
  }

  String _extractMessageFromMessageProvider(
    BuildContext context,
    MessageResolver provider,
  ) {
    String message = '';
    if (provider is LocalizedMessageResolver) {
      message = provider.getLocalizedMessage(context);
    } else if (provider is StaticMessageResolver) {
      message = provider.message;
    }
    return message;
  }

  void _showSuccessMessage(BuildContext context, String message) {
    final snackBar = _getSnackBar(
      context,
      message,
      Icons.done,
      Colors.green,
      Colors.green.shade50,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _showErrorMessage(BuildContext context, String message) {
    final snackBar = _getSnackBar(
      context,
      message,
      Icons.done,
      Colors.red,
      Colors.red.shade50,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _showWarningMessage(BuildContext context, String message) {
    final snackBar = _getSnackBar(
      context,
      message,
      Icons.done,
      Colors.yellow,
      Colors.yellow.shade50,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  SnackBar _getSnackBar(
    BuildContext context,
    String message,
    IconData icon,
    Color color,
    Color backgroundColor,
  ) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(color: color),
              maxLines: 2,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  PreferredSizeWidget? appBar(BuildContext context) => null;

  Widget body(BuildContext context);

  void handleStateChange(BuildContext context, ViewState state) {}

  Color pageBackgroundColor(BuildContext context) {
    return context.theme.colorScheme.surface;
  }

  Color statusBarColor(BuildContext context) {
    return context.theme.colorScheme.surface;
  }

  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }

  Widget? _bottomSheet(BuildContext context) {
    return Wrap(
      children: [
        bottomSheet(context) ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget? bottomSheet(BuildContext context) {
    return null;
  }

  SystemUiOverlayStyle? get systemUiOverlayStyle {
    return null;
  }

  bool get useTopSafeArea => true;

  bool get useBottomSafeArea => true;

  bool get activeGestureDetector => true;

  bool get showNetworkStatus => true;

  void _onTapGestureDetector() {
    if (activeGestureDetector) {
      closeKeyboard();
    }
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
