import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/assets/dimens.dart';
import 'package:flutter/material.dart';

class ImageSliderView extends StatefulWidget {
  const ImageSliderView({super.key});

  @override
  State<ImageSliderView> createState() => _ImageSliderViewState();
}

class _ImageSliderViewState extends State<ImageSliderView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///10-2, 3:30-6:30
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
        CarouselSlider(
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
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return CachedNetworkImage(
                  imageUrl: 'https://i.imgur.com/DG5yU2k.png',
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
        ),
        sliderIndicator(
          activeIndex: currentIndex,
          count: 5,
        ),
      ],
    );
  }

  Widget sliderIndicator({required int activeIndex, required int count}) {
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
