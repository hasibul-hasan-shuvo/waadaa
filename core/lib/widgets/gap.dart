import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A smart Gap widget that creates space only when its immediate parent is Row or Column.
///
/// This Gap widget checks its immediate parent and applies the specified size
/// to the appropriate dimension (width for Row, height for Column).
/// If the immediate parent is not a Row or Column, it renders with zero size.
class Gap extends StatelessWidget {
  /// Creates a gap with immediate parent detection.
  ///
  /// The [size] parameter will be applied as width when the immediate parent is a [Row],
  /// or as height when the immediate parent is a [Column].
  /// If the immediate parent is neither Row nor Column, the Gap will have zero size.
  const Gap(this.size, {Key? key}) : super(key: key);

  /// The size of the gap (width in Row, height in Column).
  final double size;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final RenderObject? parentRenderObject =
            context.findRenderObject()?.parent;
        if (parentRenderObject is RenderFlex) {
          final Axis direction = parentRenderObject.direction;

          return SizedBox(
            width: direction == Axis.horizontal ? size : 0.0,
            height: direction == Axis.vertical ? size : 0.0,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
