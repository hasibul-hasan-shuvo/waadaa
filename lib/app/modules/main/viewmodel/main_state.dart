import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';
import 'package:waadaa/app/modules/main/models/bottom_nav_items.dart';

class MainState extends BaseState {
  MainState({
    super.status,
    required this.selectedNavbarItem,
    required this.cachedPages,
  });

  MainState.initial()
      : selectedNavbarItem = BottomNavbarItem(
          identifier: BottomNavItems.home,
          label: BottomNavItems.home.name,
          iconData: Icons.home_outlined,
        ),
        cachedPages = {
          for (var item in BottomNavItems.values) item: SizedBox.shrink()
        };

  @override
  MainState copyWith({
    BaseStatus? status,
    BottomNavbarItem<BottomNavItems>? selectedNavbarItem,
    Map<BottomNavItems, Widget>? cachedPages,
  }) {
    return MainState(
      status: status ?? this.status,
      selectedNavbarItem: selectedNavbarItem ?? this.selectedNavbarItem,
      cachedPages: cachedPages ?? this.cachedPages,
    );
  }

  final BottomNavbarItem<BottomNavItems> selectedNavbarItem;

  final Map<BottomNavItems, Widget> cachedPages;

  MainState updateSelectedNavbarItem(
      BottomNavbarItem<BottomNavItems> newSelectedNavbarItem) {
    return copyWith(selectedNavbarItem: newSelectedNavbarItem);
  }
}
