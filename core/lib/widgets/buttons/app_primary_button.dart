import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppPrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  bool? isEnabled;
  bool? isLoading;
  double? width;
  double? height;

  AppPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isEnabled,
    this.isLoading,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? CircularProgressIndicator(
            color: context.theme.primaryColor,
          )
        : SizedBox(
            height: height,
            width: width ?? MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: Dimens.paddingSmall,
                  horizontal: Dimens.paddingLarge,
                ),
                elevation: 0,
                backgroundColor: context.theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.radiusSmall),
                ),
                disabledBackgroundColor:
                    context.theme.primaryColor.withValues(alpha: 0.5),
              ),
              onPressed: isEnabled ?? true ? onPressed : null,
              child: FittedBox(
                child: Text(
                  title,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: context.theme.colorScheme.surface),
                ),
              ),
            ),
          );
  }
}
