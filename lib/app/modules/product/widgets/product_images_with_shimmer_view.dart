import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_images_view.dart';

class ProductImagesWithShimmerView
    extends ObservableView<ProductViewModel, ProductState, bool> {
  const ProductImagesWithShimmerView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
            child: Container(
              height: Dimens.heroBannerHeight,
              color: Colors.black,
            ),
          )
        : ProductImagesView();
  }

  @override
  bool observeState(state) {
    return state.isProductImagesLoading;
  }
}
