import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/product/models/product_price_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductPriceView extends ObservableView<ProductViewModel, ProductState,
    ProductPriceUiModel> {
  const ProductPriceView({super.key});

  @override
  Widget body(BuildContext context, ProductPriceUiModel state) {
    return state.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "${state.currency} ${state.discountPrice}",
                      style: context.textTheme.titleLarge,
                    ),
                    Gap(Dimens.paddingSmall),
                    Text(
                      "${state.currency} ${state.price}",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Gap(Dimens.paddingSmall),
                    if (state.discount.isNotEmpty)
                      Text(
                        "${state.discount}${context.localizations.postfixDiscount}",
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
                Text(
                  "(${context.localizations.messageTaxInclusive})",
                  style:
                      context.textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
  }

  @override
  ProductPriceUiModel observeState(ProductState state) {
    return state.productPrice;
  }
}
