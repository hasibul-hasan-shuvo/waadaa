import 'package:core/assets/dimens.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class BannerButton extends StatelessWidget {
  const BannerButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: Dimens.paddingSmall,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radiusSmall),
          ),
        ),
        overlayColor: WidgetStateProperty.all(Colors.white.withAlpha(40)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ).paddingSymmetric(
          vertical: Dimens.paddingVerySmall, horizontal: Dimens.paddingLarge),
    );
  }
}
