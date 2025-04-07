import 'package:core/assets/dimens.dart';
import 'package:core/base/base_page.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/gap.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_bottom_sticky_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_details_frequently_bought_products_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_details_recently_viewed_products_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_details_recommended_products_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_estimated_delivery_with_shimmer_effect_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_images_with_shimmer_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_info_with_shimmer_effect_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_price_with_shimmer_effect_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_variants_view.dart';

class ProductPage extends BasePage<ProductViewModel, ProductState> {
  final String id;

  const ProductPage({
    super.key,
    required this.id,
  });

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PrimaryAppBar(
      title: '',
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: context.colors.onSurface,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.share_outlined),
          color: context.colors.onSurface,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    context.getViewModel<ProductViewModel>().setId(id);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductImagesWithShimmerView(),
          Gap(Dimens.paddingMedium),
          ProductInfoWithShimmerEffectView(),
          Gap(Dimens.paddingMedium),
          ProductPriceWithShimmerEffectView(),
          Gap(Dimens.paddingMedium),
          ProductVariantsView(),
          Gap(Dimens.paddingMedium),
          ProductEstimatedDeliveryWithShimmerEffectView(),
          ProductDetailsFrequentlyBoughtProductsView(),
          ProductDetailsRecommendedProductsView(),
          ProductDetailsRecentlyViewedProductsView(),
          Gap(Dimens.size150),
        ],
      ),
    );
  }

  @override
  Widget? bottomSheet(BuildContext context) {
    return ProductBottomStickyView();
  }
}
