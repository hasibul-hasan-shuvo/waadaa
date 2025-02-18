import 'package:domain/models/side_menu_model.dart';

class SideMenuUIModel {
  String id;
  String? type;
  String title;
  String targetUrl;
  String imageUrl;
  String category;

  SideMenuUIModel({
    required this.id,
    this.type,
    required this.title,
    required this.targetUrl,
    required this.imageUrl,
    required this.category,
  });

  factory SideMenuUIModel.fromSideMenuDomain(SideMenu sideMenu) {
    return SideMenuUIModel(
      id: sideMenu.id,
      type: sideMenu.type,
      title: sideMenu.title,
      targetUrl: sideMenu.targetUrl,
      imageUrl: sideMenu.imageUrl,
      category: sideMenu.category,
    );
  }
}
