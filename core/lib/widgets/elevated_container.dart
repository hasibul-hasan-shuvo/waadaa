import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double borderWidth;
  final bool isBorderEnabled;
  final double? height;
  final double? width;

  const ElevatedContainer({
    super.key,
    required this.child,
    this.bgColor,
    this.padding,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.isBorderEnabled = false,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? Dimens.radiusSmall),
      child: Container(
        key: key,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(borderRadius ?? Dimens.radiusSmall),
          color: bgColor ?? context.theme.cardColor,
          border: isBorderEnabled
              ? Border.all(
                  color: context.theme.primaryColor,
                  width: borderWidth,
                )
              : null,
        ),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
