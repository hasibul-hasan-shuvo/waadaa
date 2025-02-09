import 'package:core/assets/dimens.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem<Identifier extends Enum> {
  final Identifier identifier;
  final String label;
  final IconData? iconData;
  final String? assetIcon;

  const BottomNavbarItem({
    required this.identifier,
    required this.label,
    this.iconData,
    this.assetIcon,
  }) : assert(
          (iconData == null) !=
              (assetIcon == null), // Ensures exactly one is provided
          'Either iconData or assetIcon must be provided, but not both.',
        );

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      label: label,
      icon: iconData != null
          ? Icon(
              iconData,
              size: Dimens.iconMedium,
            )
          : AssetImageView(
              fileName: assetIcon!,
              height: Dimens.iconMedium,
              width: Dimens.iconMedium,
            ),
    );
  }
}
