import 'dart:developer';

import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({super.key});

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
                imageUrl: "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Gi4a8u-9uWwD6afP9kbKm32eIlvXWYMfi0bZKNtp8nlda-gYwuugvRYlLxLpUpLJEVxjWgWXrHKR8TxY-B69cf2z5UIf4bU9zJX1e8jc71l6QaGBzFIdm6Evv-AZsVcv6Q5-CgR~qRyCTTM8dOgSJRN4u~ZRmP8FIfzQPKwy1JXovfX077Np3tKYiqaNKWBZXw7EiwXA6DEMF2ATjBnqpCBjpkqzmfGNVVKBmlg2k23AMMlKqY5FqGerRopWaj3tI7XaNqeKdUw46tBY8UJuCdmU~zBVT73AeHpVjmj-49y7T2EhIcRjKZDrUdjcPPQD~k3o6tzejpnB90DO8vRO5A__",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            "NIKE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Dunks 01, maroon red",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "TK 12,000",
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
