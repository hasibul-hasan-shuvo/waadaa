import 'package:core/assets/app_icons.dart';
import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/services/url_launcher_service.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/gap.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_variant_header_view.dart';

class ProductSizeVariantHeaderView
    extends ObservableView<ProductViewModel, ProductState, String> {
  final String variantKey;

  const ProductSizeVariantHeaderView({
    super.key,
    required this.variantKey,
  });

  @override
  Widget body(BuildContext context, String state) {
    return Row(
      children: [
        Expanded(
          child: ProductVariantHeaderView(
            variantKey: variantKey,
          ),
        ),
        Ripple(
          onTap: () {
            UrlLauncherService.launchUrl(state);
          },
          child: Row(
            children: [
              AssetImageView(
                fileName: AppIcons.sizeChart,
                width: Dimens.iconMedium,
              ),
              Gap(Dimens.marginVerySmall),
              Text(
                context.localizations.buttonTextSizeChart,
                style: context.textTheme.bodyMedium
                    ?.copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  String observeState(ProductState state) {
    return state.sizeChartUrl;
  }
}
