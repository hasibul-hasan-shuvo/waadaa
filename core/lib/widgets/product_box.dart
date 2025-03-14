import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/services/logger_service.dart';
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
        AppLogger.d("product box");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              color: Color(0xFFF7F5F2),
              padding: EdgeInsets.all(25),
              child: NetworkImageView(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: Dimens.padding12),
          Text(
            name,
            style: context.textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            style: context.textTheme.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "$currency $price",
            style: context.textTheme.titleSmall,
          )
        ],
      ).paddingSymmetric(
        horizontal: Dimens.padding1,
        vertical: Dimens.padding1,
      ),
    );
  }
}
