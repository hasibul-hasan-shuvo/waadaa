import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/gap.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_price_view.dart';

class ProductPriceWithShimmerEffectView
    extends ObservableView<ProductViewModel, ProductState, bool> {
  const ProductPriceWithShimmerEffectView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: Dimens.size20,
                        width: Dimens.size50,
                        color: Colors.grey,
                      ),
                      Gap(Dimens.paddingMedium),
                      Container(
                        height: Dimens.size20,
                        width: Dimens.size50,
                        color: Colors.grey,
                      ),
                      Gap(Dimens.paddingMedium),
                      Flexible(
                        child: Container(
                          height: Dimens.size20,
                          width: Dimens.size100,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Gap(Dimens.paddingSmall),
                  Container(
                    height: Dimens.size10,
                    width: Dimens.size150,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          )
        : ProductPriceView();
  }

  @override
  bool observeState(ProductState state) {
    return state.isPriceLoading;
  }
}
