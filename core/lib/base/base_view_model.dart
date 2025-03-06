import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';
import 'package:core/exceptions/api_exception.dart';
import 'package:core/exceptions/app_exception.dart';
import 'package:core/exceptions/json_format_exception.dart';
import 'package:core/exceptions/network_exception.dart';
import 'package:core/exceptions/not_found_exception.dart';
import 'package:core/exceptions/service_unavailable_exception.dart';
import 'package:core/exceptions/timeout_exception.dart';
import 'package:core/exceptions/unauthorized_exception.dart';
import 'package:core/localizations/message_resolver.dart';
import 'package:core/localizations/static_message_resolver.dart';
import 'package:core/services/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waadaa/app/localizations/json_format_error_localized_message.dart';
import 'package:waadaa/app/localizations/network_error_localized_message.dart';
import 'package:waadaa/app/localizations/not_found_localized_message.dart';
import 'package:waadaa/app/localizations/service_unavailable_localized_message.dart';
import 'package:waadaa/app/localizations/timeout_localized_message.dart';
import 'package:waadaa/app/localizations/unauthorized_localized_message.dart';

abstract class BaseViewModel<ViewState extends BaseState>
    extends Cubit<ViewState> with WidgetsBindingObserver {
  BaseViewModel(super.initialState) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      onResume();
    } else if (state == AppLifecycleState.inactive) {
      onInactive();
    } else if (state == AppLifecycleState.paused) {
      onPaused();
    } else if (state == AppLifecycleState.detached) {
      onDetached();
    }
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  void onResume() {}

  void onInactive() {}

  void onPaused() {}

  void onDetached() {}

  Future<dynamic> callDataService<DataResponse>(
    Future<DataResponse> future, {
    Function(Exception exception)? onError,
    Function(DataResponse response)? onSuccess,
    Function? onStart,
    Function? onComplete,
    bool enableErrorMessage = true,
  }) async {
    Exception? exception;

    _handleStart(onStart);

    try {
      final DataResponse response = await future;

      if (onSuccess != null) onSuccess(response);

      _handleCompletion(onComplete);
      return response;
    } catch (error) {
      exception = _handleException(error, enableErrorMessage);
      if (onError != null) onError(exception);
    }

    _handleCompletion(onComplete);
  }

  void _handleStart(Function? onStart) {
    if (onStart == null) {
      showLoader();
    } else {
      onStart();
    }
  }

  void _handleCompletion(Function? onComplete) {
    if (onComplete == null) {
      hideLoader();
    } else {
      onComplete();
    }
  }

  Exception _handleException(Object error, bool enableErrorMessage) {
    MessageResolver? errorMessage;
    String? errorMessageString;
    Exception exception;

    if (error is ServiceUnavailableException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = ServiceUnavailableLocalizedMessage(
        placeHolderMessage: error.message,
      );
    } else if (error is UnauthorizedException) {
      logout();
      exception = error;
      errorMessageString = error.message;
      errorMessage = UnauthorizedLocalizedMessage(
        placeHolderMessage: error.message,
      );
    } else if (error is TimeoutException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = TimeoutLocalizedMessage(
        placeHolderMessage: error.message,
      );
    } else if (error is NetworkException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = NetworkErrorLocalizedMessage(
        placeHolderMessage: error.message,
      );
    } else if (error is JsonFormatException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = JsonFormatErrorLocalizedMessage(
        placeHolderMessage: error.message,
      );
    } else if (error is NotFoundException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = NotFoundLocalizedMessage(
        placeHolderMessage: error.message,
      );
    } else if (error is ApiException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = StaticMessageResolver(error.message);
    } else if (error is AppException) {
      exception = error;
      errorMessageString = error.message;
      errorMessage = StaticMessageResolver(error.message);
    } else {
      exception = AppException(message: "$error");
      AppLogger.e("Controller>>>>>> error $error");
      errorMessage = StaticMessageResolver("$error");
    }

    if (errorMessageString != null) {
      AppLogger.e(errorMessageString);
    }

    if (enableErrorMessage) {
      showErrorMessage(errorMessage);
    }

    return exception;
  }

  void showLoader() {
    // TODO: need to show loader
  }

  void hideLoader() {
    // TODO: need to hide loader
  }

  void logout() {
    // TODO: need to logout
  }

  void showSuccessMessage(MessageResolver messageResolver) {
    emit(
      state.copyWith(
        status: SuccessMessageStatus(
          messageResolver: messageResolver,
        ),
      ) as ViewState,
    );
  }

  void showErrorMessage(MessageResolver messageResolver) {
    emit(
      state.copyWith(
        status: ErrorMessageStatus(
          messageResolver: messageResolver,
        ),
      ) as ViewState,
    );
  }

  void showWarningMessage(MessageResolver messageResolver) {
    emit(
      state.copyWith(
        status: WarningMessageStatus(
          messageResolver: messageResolver,
        ),
      ) as ViewState,
    );
  }

  void updateState(ViewState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }

  void onCreated() {}

  void onViewReady() {}
}
