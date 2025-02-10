import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/widgets/buttons/banner_button.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';

class HeroBannerSlider extends StatelessWidget {
  final List<Widget> herroBanners;
  final Function(int index) onPageChanged;

  const HeroBannerSlider({
    super.key,
    required this.herroBanners,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
          onPageChanged(index);
        },
      ),
      items: List.generate(5, (index) {
        return Stack(
          children: [
            NetworkImageView(
              imageUrl: "https://i.imgur.com/DG5yU2k.png",
              fit: BoxFit.fill,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 32,
              left: 16,
              child: SizedBox(
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Redefine your wardrobe",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Discover the latest in fashion with Zara’s curated collection.",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20),
                    BannerButton(
                      onPressed: () {},
                      title: "EXPLORE",
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
