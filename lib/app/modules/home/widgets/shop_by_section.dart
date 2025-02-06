import 'dart:developer';

import 'package:core/assets/app_images.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';

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
            "Shop by",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ).paddingOnly(bottom: 10),
          Row(
            children: [
              shopItem(
                context: context,
                name: "Sale",
                imgPath: AppImages.iphoneImg,
              ),
              SizedBox(width: 8),
              shopItem(
                context: context,
                name: "Overseas",
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
    return Expanded(
      child: Ripple(
        onTap: () {
          log(name);
          context.getViewModel<HomeViewModel>().updateMessage();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFDEDEDE), // Border color
              width: 0.5, // Border width
            ),
            borderRadius: BorderRadius.circular(2.0),
            color: Colors.white,
          ),
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
                ).paddingOnly(top: 5, right: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
