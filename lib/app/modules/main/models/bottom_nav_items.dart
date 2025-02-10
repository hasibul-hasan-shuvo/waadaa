import 'package:core/assets/app_icons.dart';
import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';

enum BottomNavItems {
  home,
  categories,
  brands,
  cart,
  account,
}

extension NavItemsExtension on BottomNavItems {
  BottomNavbarItem<BottomNavItems> toBottomNavbarItem(BuildContext context) {
    switch (this) {
      case BottomNavItems.home:
        return BottomNavbarItem(
          identifier: BottomNavItems.home,
          label: context.localizations.bottomNavItemHome,
          assetIcon: AppIcons.home,
        );
      case BottomNavItems.categories:
        return BottomNavbarItem(
          identifier: BottomNavItems.categories,
          label: context.localizations.bottomNavItemCategories,
          assetIcon: AppIcons.categories,
        );
      case BottomNavItems.brands:
        return BottomNavbarItem(
          identifier: BottomNavItems.brands,
          label: context.localizations.bottomNavItemBrands,
          assetIcon: AppIcons.brands,
        );
      case BottomNavItems.cart:
        return BottomNavbarItem(
          identifier: BottomNavItems.cart,
          label: context.localizations.bottomNavItemCart,
          assetIcon: AppIcons.cart,
        );
      case BottomNavItems.account:
        return BottomNavbarItem(
          identifier: BottomNavItems.account,
          label: context.localizations.bottomNavItemAccount,
          assetIcon: AppIcons.account,
        );
    }
  }

  int get index => BottomNavItems.values.indexOf(this);
}
