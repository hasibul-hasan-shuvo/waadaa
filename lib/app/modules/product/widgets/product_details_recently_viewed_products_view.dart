import 'package:core/base/observable_view.dart';
import 'package:core/services/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';
import 'package:waadaa/app/modules/product/widgets/product_details_suggested_product_list_view.dart';

class ProductDetailsRecentlyViewedProductsView extends ObservableView<
    ProductViewModel, ProductState, List<ProductUiModel>> {
  const ProductDetailsRecentlyViewedProductsView({super.key});

  @override
  Widget body(BuildContext context, List<ProductUiModel> state) {
    return state.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(),
              ProductDetailsSuggestedProductListView(
                title: context.localizations.titleRecentlyViewed,
                subTitle: context.localizations.subtitleRecentlyViewed,
                products: state,
                viewAllPressed: () {
                  AppLogger.d("view all pressed...");
                },
              ),
            ],
          )
        : SizedBox.shrink();
  }

  @override
  List<ProductUiModel> observeState(state) {
    return state.recentlyViewedProducts;
  }
}
