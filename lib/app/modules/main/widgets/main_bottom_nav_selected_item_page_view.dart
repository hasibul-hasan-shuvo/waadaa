import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/account/view/account_page.dart';
import 'package:waadaa/app/modules/brands/view/brands_page.dart';
import 'package:waadaa/app/modules/categories/view/categories_page.dart';
import 'package:waadaa/app/modules/home/view/home_page.dart';
import 'package:waadaa/app/modules/main/models/bottom_nav_items.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_state.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_view_model.dart';
import 'package:waadaa/app/modules/my_cart/view/my_cart_page.dart';

class MainBottomNavSelectedItemPageView
    extends ObservableView<MainViewModel, MainState, BottomNavItems> {
  const MainBottomNavSelectedItemPageView({super.key});

  @override
  Widget body(BuildContext context, BottomNavItems state) {
    var cachedPages = context.getViewModel<MainViewModel>().state.cachedPages;
    if (cachedPages[state] is SizedBox) {
      cachedPages[state] = _createPage(state);
    }

    return IndexedStack(
      index: state.index,
      children: cachedPages.values.toList(),
    );
  }

  Widget _createPage(BottomNavItems state) {
    switch (state) {
      case BottomNavItems.home:
        return const HomePage();
      case BottomNavItems.categories:
        return const CategoriesPage();
      case BottomNavItems.brands:
        return const BrandsPage();
      case BottomNavItems.cart:
        return const MyCartPage();
      case BottomNavItems.account:
        return const AccountPage();
    }
  }

  @override
  BottomNavItems observeState(MainState state) =>
      state.selectedNavbarItem.identifier;
}
