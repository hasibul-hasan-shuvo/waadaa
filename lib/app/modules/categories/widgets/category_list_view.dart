import 'package:core/services/logger_service.dart';
import 'package:domain/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';

class CategoryListView extends ObservableView<CategoriesViewModel,
    CategoriesState, List<CategoryModel>?> {
  const CategoryListView({
    super.key,
  });

  @override
  Widget body(
    BuildContext context,
    List<CategoryModel>? state,
  ) {
    AppLogger.i("categoryFromView: $state");
    return SliverList.builder(
      itemCount: state?.length,
      itemBuilder: (context, index) {
        final category = state?[index];

        return ListTile(
          title: Text(category?.name ?? ''),
          subtitle: Text(category?.slug ?? ''),
          onTap: () => {},
        );
      },
    );
  }

  @override
  List<CategoryModel>? observeState(CategoriesState state) {
    return state.categoryModels;
  }
}
