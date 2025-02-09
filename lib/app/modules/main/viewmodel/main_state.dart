import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';
import 'package:waadaa/app/modules/main/models/bottom_nav_items.dart';

class MainState extends BaseState {
  final BottomNavbarItem selectedNavbarItem;

  MainState({
    super.status,
    required this.selectedNavbarItem,
  });

  MainState.initial()
      : selectedNavbarItem = BottomNavbarItem(
          identifier: BottomNavItems.home,
          label: BottomNavItems.home.name,
          iconData: Icons.home_outlined,
        );

  @override
  MainState copyWith({
    BaseStatus? status,
    BottomNavbarItem? selectedNavbarItem,
  }) {
    return MainState(
      status: status ?? this.status,
      selectedNavbarItem: selectedNavbarItem ?? this.selectedNavbarItem,
    );
  }

  MainState updateSelectedNavbarItem(BottomNavbarItem newSelectedNavbarItem) {
    return copyWith(selectedNavbarItem: newSelectedNavbarItem);
  }
}
