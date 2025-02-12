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

  factory SideMenuUIModel.fromDomain(SideMenu SideMenu) {
    return SideMenuUIModel(
      id: SideMenu.id,
      type: SideMenu.type,
      title: SideMenu.title,
      targetUrl: SideMenu.targetUrl,
      imageUrl: SideMenu.imageUrl,
      category: SideMenu.category,
    );
  }
}
