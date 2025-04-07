import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';
import 'package:waadaa/app/router/navigator.dart';

class ProductDetailsSuggestedProductListView extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<ProductUiModel> products;
  final Function() viewAllPressed;

  const ProductDetailsSuggestedProductListView({
    super.key,
    required this.title,
    this.subTitle,
    required this.products,
    required this.viewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleLarge,
                maxLines: 2,
              ),
            ),
            TextButton(
              onPressed: viewAllPressed,
              child: Text(
                context.localizations.viewAllText.toUpperCase(),
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.theme.colorScheme.primary),
              ),
            ),
          ],
        ),
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
            ProductUiModel product = products[index];

            return ProductBox(
              name: product.name,
              description: product.description,
              imageUrl: product.imageUrl,
              price: product.price,
              currency: product.currency,
              onTap: () => AppNavigator.instance.navigateToProduct(product.id),
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: Dimens.padding15);
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      );
}
