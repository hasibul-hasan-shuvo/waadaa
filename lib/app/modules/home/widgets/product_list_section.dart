import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:core/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';

class ProductListSection extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<ProductUiModel> products;
  final Function() viewAllPressed;

  const ProductListSection({
    super.key,
    required this.title,
    this.subTitle,
    required this.products,
    required this.viewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleLarge,
          ).paddingOnly(top: Dimens.padding10),
          if (subTitle != null)
            Text(
              subTitle!,
              style: context.textTheme.bodySmall,
            ).paddingOnly(top: Dimens.paddingSmall, bottom: Dimens.padding10),
          SizedBox(height: Dimens.padding10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: _gridDelegate,
            itemBuilder: (context, index) {
              return ProductBox(
                name: products[index].name,
                description: products[index].description,
                imageUrl: products[index].imageUrl,
                price: products[index].price,
                currency: products[index].currency,
              );
            },
          ),
          if (products.isNotEmpty)
            AppSecondaryButton(
              title: context.localizations.viewAllText,
              onPressed: viewAllPressed,
            ).paddingSymmetric(vertical: Dimens.padding10),
        ],
      ).paddingSymmetric(horizontal: Dimens.padding15),
    );
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      );
}
