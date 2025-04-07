import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/product/models/product_variant_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ItemProductVariantView extends StatelessWidget {
  final String variantKey;
  final ProductVariantUiModel variant;
  final bool isSelected;

  const ItemProductVariantView({
    super.key,
    required this.variantKey,
    required this.variant,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: variant.isAvailable ? 1 : 0.5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? context.colors.onSurface : Colors.grey),
        ),
        margin: EdgeInsets.only(
          right: Dimens.paddingSmall,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: Dimens.size40,
          ),
          child: Ripple(
            onTap: variant.isAvailable
                ? () {
                    context.getViewModel<ProductViewModel>().onVariantSelect(
                          variantKey,
                          variant.name,
                        );
                  }
                : null,
            child: Center(
              child: Text(
                variant.name,
                style: context.textTheme.bodySmall,
              ).paddingAll(Dimens.padding2),
            ),
          ),
        ),
      ),
    );
  }
}
