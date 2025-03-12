import 'dart:developer';

import 'package:core/base/observable_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/product_list_section.dart';

class LatestProductsView
    extends ObservableView<HomeViewModel, HomeState, List<ProductUiModel>> {
  const LatestProductsView({super.key});

  @override
  Widget body(BuildContext context, List<ProductUiModel> state) {
    return state.isNotEmpty
        ? ProductListSection(
            title: context.localizations.latestProductTitle,
            // subTitle: "The Nike Dunk Low is an easy score for your wardrobe",
            products: state,
            viewAllPressed: () {
              log("view all pressed...");
            },
          )
        : SizedBox.shrink();
  }

  @override
  List<ProductUiModel> observeState(state) {
    return state.latestProducts ?? [];
  }
}
