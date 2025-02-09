import 'package:core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/main/models/bottom_nav_items.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_state.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_view_model.dart';

class MainBottomNavbarView
    extends ObservableView<MainViewModel, MainState, BottomNavbarItem> {
  const MainBottomNavbarView({super.key});

  @override
  Widget body(BuildContext context, BottomNavbarItem state) {
    return BottomNavbar(
      selectedItem: state,
      onItemSelect: context.getViewModel<MainViewModel>().onNavItemSelect,
      items: BottomNavItems.values
          .map((item) => item.toBottomNavbarItem(context))
          .toList(),
    );
  }

  @override
  BottomNavbarItem<Enum> observeState(MainState state) {
    return state.selectedNavbarItem;
  }
}
