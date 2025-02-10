import 'package:core/assets/dimens.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            vertical: icon != null ? Dimens.paddingSmall : Dimens.paddingSmall,
            horizontal: Dimens.paddingSmall,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radiusSmall),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox(),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            // style: context.theme.outlinedButtonTheme.style?.textStyle
            //     ?.resolve(onPressed != null
            //         ? {WidgetState.focused}
            //         : {WidgetState.disabled}),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ).paddingSymmetric(vertical: Dimens.paddingSmall),
    );
  }
}
