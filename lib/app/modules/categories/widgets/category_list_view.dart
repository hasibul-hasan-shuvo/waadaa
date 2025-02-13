import 'package:core/assets/dimens.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/categories/model/category_ui_model.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';
import 'package:waadaa/app/modules/categories/widgets/item_category_view.dart';

class CategoryListView extends ObservableView<CategoriesViewModel,
    CategoriesState, List<CategoryUIModel>> {
  const CategoryListView({
    super.key,
  });

  @override
  Widget body(
    BuildContext context,
    List<CategoryUIModel> state,
  ) {
    return Container(
      height: Dimens.heightMedium,
      margin: const EdgeInsets.symmetric(horizontal: Dimens.marginSmall),
      child: ListView.builder(
        itemCount: state.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final category = state[index];

          return GestureDetector(
            onTap: () {
              final viewModel = context.getViewModel<CategoriesViewModel>();
              viewModel.updateSelectedCategory(category);
            },
            child: ItemCategory(index: index),
          );
        },
      ),
    );
  }

  @override
  List<CategoryUIModel> observeState(CategoriesState state) {
    return state.categoryList;
  }
}
