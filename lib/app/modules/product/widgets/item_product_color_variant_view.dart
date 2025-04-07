import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ItemProductColorVariantView extends StatelessWidget {
  final String variantKey;
  final ProductVariantUiModel variant;
  final bool isSelected;

  const ItemProductColorVariantView({
    super.key,
    required this.variantKey,
    required this.variant,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return variant.imageUrl.isEmpty
        ? SizedBox()
        : Opacity(
            opacity: variant.isAvailable ? 1 : 0.5,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected ? context.colors.onSurface : Colors.grey),
              ),
              margin: EdgeInsets.only(
                right: Dimens.paddingSmall,
              ),
              child: Ripple(
                onTap: variant.isAvailable
                    ? () {
                        context
                            .getViewModel<ProductViewModel>()
                            .onVariantSelect(
                              variantKey,
                              variant.name,
                            );
                      }
                    : null,
                child: NetworkImageView(
                  imageUrl: variant.imageUrl,
                  height: Dimens.size40,
                  width: Dimens.size40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}
