import 'dart:developer';

import 'package:domain/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/product_list_section.dart';

class RecommendedProductsView
    extends ObservableView<HomeViewModel, HomeState, List<ProductModel>> {
  const RecommendedProductsView({super.key});

  @override
  Widget body(BuildContext context, List<ProductModel> state) {
    return ProductListSection(
      title: context.localizations.latestProductTitle,
      // subTitle: "The Nike Dunk Low is an easy score for your wardrobe",
      products: state,
      viewAllPressed: () {
        log("view all pressed...");
      },
    );
  }

  @override
  List<ProductModel> observeState(state) {
    return state.latestProducts ?? [];
  }
}
