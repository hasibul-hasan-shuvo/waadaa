import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:flutter/material.dart';

class BottomNavbar<Identifier extends Enum> extends StatelessWidget {
  final BottomNavbarItem selectedItem;
  final Function(BottomNavbarItem) onItemTap;
  final List<BottomNavbarItem> items;

  const BottomNavbar({
    super.key,
    required this.selectedItem,
    required this.onItemTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => onItemTap(items[index]),
      selectedItemColor: context.colors.primary,
      unselectedItemColor: Colors.grey,
      items: items.map((item) => item.toBottomNavigationBarItem()).toList(),
    );
  }

  int get currentIndex =>
      items.indexWhere((item) => item.identifier == selectedItem.identifier);
}
