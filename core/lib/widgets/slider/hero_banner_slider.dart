import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/widgets/sliding_indicator.dart';
import 'package:flutter/material.dart';

class HeroBannerSlider extends StatelessWidget {
  final List<Widget> bannersList;

  const HeroBannerSlider({
    super.key,
    required this.bannersList,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: add sliding indicator
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 215.0,
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
              //update hero banner index by value notifier
            },
          ),
          items: bannersList,
        ),
        SlidingIndicator(
          activeIndex: 2,
          count: 5,
        ),
      ],
    );
  }
}
