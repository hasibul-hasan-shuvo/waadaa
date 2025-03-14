import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/services/logger_service.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/models/category_offer_ui_model.dart';

class ItemOfferCategoryWidget extends StatelessWidget {
  final CategoryOfferUiModel offerItem;

  const ItemOfferCategoryWidget({super.key, required this.offerItem});

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: () {
        AppLogger.d("category item");
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
            style: context.textTheme.bodyMedium,
          ),
        ],
      ).paddingAll(1),
    );
  }
}
