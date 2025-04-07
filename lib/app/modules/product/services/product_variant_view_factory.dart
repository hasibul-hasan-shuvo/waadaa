import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';
import 'package:waadaa/app/modules/product/widgets/item_product_color_variant_view.dart';
import 'package:waadaa/app/modules/product/widgets/item_product_variant_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_color_variant_header_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_size_variant_header_view.dart';
import 'package:waadaa/app/modules/product/widgets/product_variant_header_view.dart';

class ProductVariantViewFactory {
  ProductVariantViewFactory._();

  static Widget getVariantHeaderView({
    required String key,
  }) {
    switch (key.toLowerCase()) {
      case "color":
      case "colour":
        return ProductColorVariantHeaderView(variantKey: key);
      case "size":
        return ProductSizeVariantHeaderView(variantKey: key);
      default:
        return ProductVariantHeaderView(variantKey: key);
    }
  }

  static Widget getVariantItemView({
    required String key,
    required ProductVariantUiModel variant,
    required bool isSelected,
  }) {
    switch (key.toLowerCase()) {
      case "color":
      case "colour":
        return ItemProductColorVariantView(
          variantKey: key,
          variant: variant,
          isSelected: isSelected,
        );
      default:
        return ItemProductVariantView(
          variantKey: key,
          variant: variant,
          isSelected: isSelected,
        );
    }
  }
}
