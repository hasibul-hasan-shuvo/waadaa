import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/models/product_info_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductInfoView
    extends ObservableView<ProductViewModel, ProductState, ProductInfoUiModel> {
  const ProductInfoView({super.key});

  @override
  Widget body(BuildContext context, ProductInfoUiModel state) {
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
                      state.brandName,
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star_half,
                      color: context.colors.rating,
                      size: Dimens.iconMedium,
                    ),
                    Text(
                      state.rating.toString(),
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: context.colors.rating),
                    ),
                  ],
                ),
                Text(
                  state.name,
                  style: context.textTheme.titleLarge,
                ),
                Text(
                  state.description,
                  style:
                      context.textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
  }

  @override
  ProductInfoUiModel observeState(ProductState state) {
    return state.productInfo;
  }
}
