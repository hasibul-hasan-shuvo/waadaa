import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/assets/dimens.dart';
import 'package:core/widgets/slider/slider_controller.dart';
import 'package:core/widgets/slider/slider_indicators_position.dart';
import 'package:core/widgets/slider/sliding_indicator.dart';
import 'package:flutter/material.dart';

class HeroBannerSlider extends StatefulWidget {
  final List<Widget> bannersList;
  final double sliderHeight;
  final SliderIndicatorsPosition indicatorsPosition;

  const HeroBannerSlider({
    super.key,
    required this.bannersList,
    required this.sliderHeight,
    required this.indicatorsPosition,
  });

  @override
  State<HeroBannerSlider> createState() => _HeroBannerSliderState();
}

class _HeroBannerSliderState extends State<HeroBannerSlider> {
  SliderController controller = SliderController();

  @override
  Widget build(BuildContext context) {
    Widget slider = CarouselSlider(
      options: CarouselOptions(
        height: widget.sliderHeight,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          controller.updateIndex(index);
        },
      ),
      items: widget.bannersList,
    );
    Widget indicators = widget.bannersList.length > 1
        ? ValueListenableBuilder(
            valueListenable: controller.selectedIndex,
            builder: (context, value, child) {
              return SlidingIndicator(
                activeIndex: value,
                count: widget.bannersList.length,
              );
            },
          )
        : SizedBox.shrink();

    switch (widget.indicatorsPosition) {
      case SliderIndicatorsPosition.outsideTop:
      case SliderIndicatorsPosition.outsideBottom:
        return _SliderWithColumn(
          slider: slider,
          indicators: indicators,
          indicatorsPosition: widget.indicatorsPosition,
        );
      case SliderIndicatorsPosition.insideTop:
      case SliderIndicatorsPosition.insideBottom:
        return _SliderWithStack(
          slider: slider,
          indicators: indicators,
          indicatorsPosition: widget.indicatorsPosition,
        );
    }
  }
}

class _SliderWithColumn extends StatelessWidget {
  final Widget slider;
  final Widget indicators;
  final SliderIndicatorsPosition indicatorsPosition;

  const _SliderWithColumn({
    required this.slider,
    required this.indicators,
    required this.indicatorsPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (indicatorsPosition == SliderIndicatorsPosition.outsideTop)
          indicators,
        slider,
        if (indicatorsPosition == SliderIndicatorsPosition.outsideBottom)
          indicators,
      ],
    );
  }
}

class _SliderWithStack extends StatelessWidget {
  final Widget slider;
  final Widget indicators;
  final SliderIndicatorsPosition indicatorsPosition;

  const _SliderWithStack({
    required this.slider,
    required this.indicators,
    required this.indicatorsPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        slider,
        if (indicatorsPosition == SliderIndicatorsPosition.insideTop)
          Positioned(
            top: Dimens.marginSmall,
            right: Dimens.marginZero,
            left: Dimens.marginZero,
            child: indicators,
          ),
        if (indicatorsPosition == SliderIndicatorsPosition.insideBottom)
          Positioned(
            bottom: Dimens.marginSmall,
            right: Dimens.marginZero,
            left: Dimens.marginZero,
            child: indicators,
          ),
      ],
    );
  }
}
