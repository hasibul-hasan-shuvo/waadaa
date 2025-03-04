import 'dart:developer';

import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String currency;

  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: () {
        log("product box");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              color: Color(0xFFF7F5F2),
              padding: EdgeInsets.all(20),
              child: NetworkImageView(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "$currency $price",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 1, vertical: 1),
    );
  }
}
