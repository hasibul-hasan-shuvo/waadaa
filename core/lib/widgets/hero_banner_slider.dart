import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeroBannerSlider extends StatelessWidget {
  final List<Widget> items;
  final Function(int index) onPageChanged;

  const HeroBannerSlider({
    super.key,
    required this.items,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        aspectRatio: 2,
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
          onPageChanged(index);
        },
      ),
      items: items,
    );
  }
}
