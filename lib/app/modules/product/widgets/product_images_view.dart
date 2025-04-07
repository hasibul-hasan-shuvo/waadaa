import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/slider/app_slider.dart';
import 'package:core/widgets/slider/slider_indicators_position.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductImagesView
    extends ObservableView<ProductViewModel, ProductState, List<String>> {
  const ProductImagesView({super.key});

  @override
  Widget body(BuildContext context, List<String> state) {
    return state.isNotEmpty
        ? AppSlider(
            sliderHeight: Dimens.heroBannerHeight,
            indicatorsPosition: SliderIndicatorsPosition.insideBottom,
            itemList: List.generate(
              state.length,
              (index) {
                return NetworkImageView(
                  imageUrl: state[index],
                  height: Dimens.heroBannerHeight,
                  fit: BoxFit.cover,
                );
              },
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  List<String> observeState(state) {
    return state.productCarouselImages;
  }
}
