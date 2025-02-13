import 'dart:developer';

import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:domain/models/category_offer_item.dart';
import 'package:flutter/material.dart';

class OfferCategoryItem extends StatelessWidget {
  final CategoryOfferItem offerItem;

  const OfferCategoryItem({super.key, required this.offerItem});

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: () {
        log("category item");
      },
      child: Column(
        children: [
          Flexible(
            child: NetworkImageView(
              imageUrl: offerItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            offerItem.tagName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ).paddingAll(1),
    );
  }
}
