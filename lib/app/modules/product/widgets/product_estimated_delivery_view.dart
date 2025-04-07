import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/product/models/product_estimated_delivery_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductEstimatedDeliveryView extends ObservableView<ProductViewModel,
    ProductState, ProductEstimatedDeliveryUiModel> {
  const ProductEstimatedDeliveryView({super.key});

  @override
  Widget body(BuildContext context, ProductEstimatedDeliveryUiModel state) {
    return state.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingMedium,
                  vertical: Dimens.paddingSmall,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.localizations.titleEstimatedDelivery,
                      style: context.textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            "${state.deliveryDays} ${context.localizations.postfixEstimatedDelivery}",
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                        Gap(Dimens.paddingSmall),
                        Text(
                          "| ${context.localizations.prefixSavingsAmount} ",
                          style: context.textTheme.labelLarge,
                        ),
                        Flexible(
                          child: Text(
                            "${state.currency} ${state.savingAmount}",
                            style: context.textTheme.labelLarge?.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  @override
  ProductEstimatedDeliveryUiModel observeState(ProductState state) {
    return state.estimatedDelivery;
  }
}
