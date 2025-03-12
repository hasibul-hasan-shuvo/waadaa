import 'dart:developer';

import 'package:core/assets/app_images.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';

class ShopBySection extends StatelessWidget {
  const ShopBySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAF8F1),
      padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.shopByTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ).paddingOnly(bottom: 10),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: _gridDelegate,
            children: [
              shopItem(
                context: context,
                name: context.localizations.saleTitle,
                imgPath: AppImages.iphoneImg,
              ),
              shopItem(
                context: context,
                name: context.localizations.overseasTitle,
                imgPath: AppImages.bagImg,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget shopItem({
    required BuildContext context,
    required String name,
    required String imgPath,
  }) {
    return Ripple(
      onTap: () {
        log(name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
        height: 70,
        decoration: _shopItemBoxDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).paddingOnly(left: 8, top: 10),
            ),
            Expanded(
              flex: 5,
              child: AssetImageView(
                fileName: imgPath,
                fit: BoxFit.fitHeight,
              ).paddingOnly(top: 7),
            ),
          ],
        ),
      ),
    );
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.2,
        crossAxisSpacing: 7,
        mainAxisSpacing: 8,
      );

  Decoration get _shopItemBoxDecoration => BoxDecoration(
        border: Border.all(
          color: Color(0xFFDEDEDE), // Border color
          width: 0.5, // Border width
        ),
        borderRadius: BorderRadius.circular(2.0),
        color: Colors.white,
      );
}
