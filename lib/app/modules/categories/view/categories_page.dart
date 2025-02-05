import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';

class CategoriesPage extends BasePage<CategoriesViewModel, CategoriesState> {
  const CategoriesPage({super.key});

  @override
  Widget body(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.getViewModel<CategoriesViewModel>().getAllCategories(),
      child: Container(
        child: Center(
          child: Text("Categories"),
        ),
      ),
    );
  }
}
