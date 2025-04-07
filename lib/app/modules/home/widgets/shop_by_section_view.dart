import 'package:core/assets/app_images.dart';
import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/services/logger_service.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';

class ShopBySectionView extends StatelessWidget {
  const ShopBySectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.secondary,
      padding: const EdgeInsets.fromLTRB(
        Dimens.padding15,
        Dimens.padding12,
        Dimens.padding15,
        Dimens.padding12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.shopByTitle,
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.start,
          ).paddingOnly(bottom: Dimens.padding10),
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
        AppLogger.d(name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Dimens.padding2,
          horizontal: Dimens.padding1,
        ),
        height: Dimens.shopItemHeight,
        decoration: _shopItemBoxDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                name,
                style: context.textTheme.labelLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).paddingOnly(
                left: Dimens.paddingSmall,
                top: Dimens.padding10,
              ),
            ),
            Expanded(
              flex: 5,
              child: AssetImageView(
                fileName: imgPath,
                fit: BoxFit.fitHeight,
              ).paddingOnly(top: Dimens.paddingSmall),
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
        borderRadius: BorderRadius.circular(Dimens.radiusVerySmall),
        color: Colors.white,
      );
}
