import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_variant_view.dart';

class ProductVariantsView extends ObservableView<ProductViewModel, ProductState,
    Map<String, List<ProductVariantUiModel>>> {
  const ProductVariantsView({super.key});

  @override
  Widget body(
      BuildContext context, Map<String, List<ProductVariantUiModel>> state) {
    return state.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingMedium,
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) {
                return ProductVariantView(
                  variantKey: state.keys.toList()[index],
                  values: state.values.toList()[index],
                );
              },
            ),
          );
  }

  @override
  Map<String, List<ProductVariantUiModel>> observeState(ProductState state) {
    return state.variants;
  }
}
