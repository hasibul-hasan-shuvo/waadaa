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

  factory SideMenuUIModel.fromDomain(SideMenuModel sideMenuModel) {
    return SideMenuUIModel(
      id: sideMenuModel.id,
      type: sideMenuModel.type,
      title: sideMenuModel.title,
      targetUrl: sideMenuModel.targetUrl,
      imageUrl: sideMenuModel.imageUrl,
      category: sideMenuModel.category,
    );
  }
}
