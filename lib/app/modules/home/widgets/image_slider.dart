import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        ///10-2, 4:30-6:30
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
        return Container(
          width: 22.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: activeIndex == index ? Colors.black : Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: (activeIndex == index || index == 0)
                  ? Radius.circular(8)
                  : Radius.circular(0),
              bottomLeft: (activeIndex == index || index == 0)
                  ? Radius.circular(8)
                  : Radius.circular(0),
              topRight: (activeIndex == index || index == count - 1)
                  ? Radius.circular(8)
                  : Radius.circular(0),
              bottomRight: (activeIndex == index || index == count - 1)
                  ? Radius.circular(8)
                  : Radius.circular(0),
            ),
          ),
        );
      }),
    );
  }
}
