import 'package:core/assets/dimens.dart';
import 'package:flutter/material.dart';

class SlidingIndicator extends StatelessWidget {
  final int activeIndex;
  final int count;

  const SlidingIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return Container(
          width: Dimens.indicatorWidth,
          height: Dimens.indicatorHeight,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: isActive ? Colors.black : Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: (isActive || index == 0)
                  ? Radius.circular(Dimens.radiusMedium)
                  : Radius.circular(Dimens.radiusZero),
              bottomLeft: (isActive || index == 0)
                  ? Radius.circular(Dimens.radiusMedium)
                  : Radius.circular(Dimens.radiusZero),
              topRight: (isActive || index == count - 1)
                  ? Radius.circular(Dimens.radiusMedium)
                  : Radius.circular(Dimens.radiusZero),
              bottomRight: (isActive || index == count - 1)
                  ? Radius.circular(Dimens.radiusMedium)
                  : Radius.circular(Dimens.radiusZero),
            ),
          ),
        );
      }),
    );
  }
}
