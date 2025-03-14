import 'package:core/widgets/banner_top_contents.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';
import 'package:core/widgets/image_overlay.dart';

class ItemHeroBannerWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String actionTitle;

  const ItemHeroBannerWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NetworkImageView(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
        ImageOverlay(),
        BannerTopContents(
          title: title,
          subTitle: subTitle,
          actionTitle: actionTitle,
          actionPressed: () {},
        ),
      ],
    );
  }
}
