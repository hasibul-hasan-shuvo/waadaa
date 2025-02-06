import 'package:core/assets/app_images.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';

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
                name: "Sale",
                imgPath: AppImages.iphoneImg,
              ),
              SizedBox(width: 10),
              shopItem(
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
    required String name,
    required String imgPath,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
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
