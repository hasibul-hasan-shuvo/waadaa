import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/categories/model/category_ui_model.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';
import 'package:waadaa/app/modules/categories/widgets/item_sub_category_view.dart';

class SubCategoryListView extends ObservableView<CategoriesViewModel,
    CategoriesState, List<CategoryUIModel>> {
  const SubCategoryListView({
    super.key,
  });

  @override
  Widget body(
    BuildContext context,
    List<CategoryUIModel> state,
  ) {
    return SliverList.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        return ItemSubCategoryView(
          state: state[index],
        );
      },
    );
  }

  @override
  List<CategoryUIModel> observeState(CategoriesState state) {
    return state.subCategoryList;
  }
}
