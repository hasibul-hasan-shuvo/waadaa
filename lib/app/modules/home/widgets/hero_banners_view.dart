import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/widgets/hero_banner_slider.dart';
import 'package:core/widgets/sliding_indicator.dart';
import 'package:flutter/material.dart';

class HeroBannersView extends StatefulWidget {
  const HeroBannersView({super.key});

  @override
  State<HeroBannersView> createState() => _HeroBannersViewState();
}

class _HeroBannersViewState extends State<HeroBannersView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 220,
        //   child: CarouselView(
        //     scrollDirection: Axis.horizontal,
        //     itemExtent: double.infinity,
        //     itemSnapping: true,
        //     children: List.generate(6, (int index) {
        //       return Image.asset(
        //         'assets/images/banner_home.png', // Path to your image
        //         fit: BoxFit.cover,
        //       );
        //     }),
        //   ),
        // ),
        HeroBannerSlider(
          items: List.generate(5, (index) {
            return CachedNetworkImage(
              imageUrl: 'https://i.imgur.com/DG5yU2k.png',
              fit: BoxFit.cover,
            );
          }),
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        SlidingIndicator(
          activeIndex: currentIndex,
          count: 5,
        ),
      ],
    );
  }
}
