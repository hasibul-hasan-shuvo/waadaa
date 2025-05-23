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
      baseColor: Colors.grey[200] ?? Colors.black12,
      highlightColor: Colors.grey[50] ?? Colors.white12,
      child: child,
    );
  }
}
