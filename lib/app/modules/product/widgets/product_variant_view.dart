import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';
import 'package:waadaa/app/modules/product/services/product_variant_view_factory.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductVariantView extends ObservableView<ProductViewModel, ProductState,
    Map<String, String>> {
  final String variantKey;
  final List<ProductVariantUiModel> values;

  const ProductVariantView({
    super.key,
    required this.variantKey,
    required this.values,
  });

  @override
  Widget body(BuildContext context, Map<String, String> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(Dimens.marginMedium),
        ProductVariantViewFactory.getVariantHeaderView(key: variantKey),
        Gap(Dimens.marginSmall),
        SizedBox(
          height: Dimens.size40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: values.length,
            itemBuilder: (context, index) {
              return ProductVariantViewFactory.getVariantItemView(
                key: variantKey,
                variant: values[index],
                isSelected: state[variantKey] == values[index].name,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Map<String, String> observeState(ProductState state) {
    return state.selectedVariant;
  }
}
