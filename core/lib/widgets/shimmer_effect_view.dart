import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectView extends StatelessWidget {
  final Widget child;

  const ShimmerEffectView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.outline,
      highlightColor: context.colors.surface,
      child: child,
    );
  }
}
