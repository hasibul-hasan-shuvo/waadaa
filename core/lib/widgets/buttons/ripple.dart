import 'package:core/assets/dimens.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color? rippleColor;
  final double rippleRadius;

  const Ripple({
    super.key,
    this.child,
    required this.onTap,
    this.rippleColor,
    this.rippleRadius = Dimens.radiusSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor ?? Color(0x0338686A),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
