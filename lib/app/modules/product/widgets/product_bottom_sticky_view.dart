import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/buttons/app_primary_button.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:core/widgets/gap.dart';
import 'package:domain/models/product/product_type.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductBottomStickyView
    extends ObservableView<ProductViewModel, ProductState, ProductType> {
  const ProductBottomStickyView({super.key});

  @override
  Widget body(BuildContext context, ProductType state) {
    return state == ProductType.single
        ? Container(
            decoration: _getDecoration(context),
            padding: EdgeInsets.all(Dimens.paddingMedium),
            child: Row(
              children: [
                Expanded(
                  child: AppPrimaryButton(
                    onPressed: () {},
                    title: context.localizations.buttonTextBuyNow.toUpperCase(),
                  ),
                ),
                Gap(Dimens.paddingSmall),
                Expanded(
                  child: AppSecondaryButton(
                    onPressed: () {},
                    title:
                        context.localizations.buttonTextAddToCart.toUpperCase(),
                  ),
                ),
              ],
            ),
          )
        : Container(
            decoration: _getDecoration(context),
            padding: EdgeInsets.all(Dimens.paddingMedium),
            child: AppPrimaryButton(
              onPressed: () {},
              title: context.localizations.buttonTextSelectItems.toUpperCase(),
            ),
          );
  }

  @override
  ProductType observeState(ProductState state) {
    return state.productType;
  }

  BoxDecoration _getDecoration(BuildContext context) => BoxDecoration(
        color: context.colors.surface,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      );
}
