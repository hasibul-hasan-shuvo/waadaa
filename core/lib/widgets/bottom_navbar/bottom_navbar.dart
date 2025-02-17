import 'package:core/assets/dimens.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:flutter/material.dart';

class BottomNavbar<Identifier extends Enum> extends StatelessWidget {
  final BottomNavbarItem<Identifier> selectedItem;
  final Function(BottomNavbarItem<Identifier>) onItemSelect;
  final List<BottomNavbarItem<Identifier>> items;

  const BottomNavbar({
    super.key,
    required this.selectedItem,
    required this.onItemSelect,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration,
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onSelect,
        destinations: items
            .map((item) => item.toNavigationDestination(
                _isItemSelected(item) ? context.colors.primary : Colors.grey))
            .toList(),
      ),
    );
  }

  void _onSelect(int index) {
    if (_currentIndex != index) onItemSelect(items[index]);
  }

  int get _currentIndex => items.indexWhere((item) => _isItemSelected(item));

  bool _isItemSelected(BottomNavbarItem item) =>
      item.identifier == selectedItem.identifier;

  BoxDecoration get _decoration => BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: Dimens.radiusLarge,
            offset: Offset(0.0, 0.5),
          )
        ],
      );
}
