import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/widgets/slider/slider_controller.dart';
import 'package:core/widgets/sliding_indicator.dart';
import 'package:flutter/material.dart';

class HeroBannerSlider extends StatefulWidget {
  final List<Widget> bannersList;
  final double sliderHeight;

  const HeroBannerSlider({
    super.key,
    required this.bannersList,
    required this.sliderHeight,
  });

  @override
  State<HeroBannerSlider> createState() => _HeroBannerSliderState();
}

class _HeroBannerSliderState extends State<HeroBannerSlider> {
  SliderController controller = SliderController();

  @override
  Widget build(BuildContext context) {
    //TODO: add sliding indicator
    return Column(
      children: [
        CarouselSlider(
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
        ),
        if (widget.bannersList.length > 1)
          ValueListenableBuilder(
            valueListenable: controller.selectedIndex,
            builder: (context, value, child) {
              return SlidingIndicator(
                activeIndex: value,
                count: widget.bannersList.length,
              );
            },
          ),
      ],
    );
  }
}
