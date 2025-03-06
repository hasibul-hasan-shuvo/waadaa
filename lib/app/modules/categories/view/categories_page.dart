import 'package:core/base/base_page.dart';
import 'package:core/assets/dimens.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';
import 'package:waadaa/app/modules/categories/widgets/category_list_view.dart';
import 'package:waadaa/app/modules/categories/widgets/sub_category_list_view.dart';

class CategoriesPage extends BasePage<CategoriesViewModel, CategoriesState> {
  const CategoriesPage({super.key});

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CategoryListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: Dimens.marginSmall),
        ),
        SubCategoryListView(),
      ],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PrimaryAppBar(
      title: context.localizations.categories,
      isBackButtonEnabled: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
