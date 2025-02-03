import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            aspectRatio: 2,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  'assets/images/banner_home.png', // Path to your image
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
        ),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: 5,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.white70,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ).paddingSymmetric(vertical: 10),
      ],
    );
  }
}
