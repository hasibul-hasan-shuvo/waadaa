import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';
import 'package:waadaa/app/modules/categories/widgets/category_list_view.dart';

class CategoriesPage extends BasePage<CategoriesViewModel, CategoriesState> {
  const CategoriesPage({super.key});

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CategoryListView(),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Categories",
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      shape: Border(
        bottom: BorderSide(
          color: context.colors.primary.withAlpha(50),
          width: 2,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
