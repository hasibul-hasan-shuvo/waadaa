import 'package:core/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';

class CategoriesPage extends BasePage<CategoriesViewModel, CategoriesState> {
  const CategoriesPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("This is categories page"),
    );
  }
}
