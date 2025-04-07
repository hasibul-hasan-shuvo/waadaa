import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_variant_header_view.dart';

class ProductColorVariantHeaderView extends ObservableView<ProductViewModel,
    ProductState, Map<String, String>> {
  final String variantKey;

  const ProductColorVariantHeaderView({
    super.key,
    required this.variantKey,
  });

  @override
  Widget body(BuildContext context, Map<String, String> state) {
    return Row(
      children: [
        ProductVariantHeaderView(
          variantKey: variantKey,
        ),
        Text(
          " : ",
          style: context.textTheme.bodyMedium,
        ),
        Expanded(
          child: Text(
            state[variantKey] ?? "",
            style: context.textTheme.bodyMedium,
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
