import 'package:domain/models/side_menu_model.dart';

class CategoryModel {
  String id;
  String name;
  int level;
  String slug;
  List<CategoryModel> subcategories;
  SideMenuModel? sideMenu;

  CategoryModel({
    required this.id,
    required this.name,
    required this.level,
    required this.slug,
    required this.subcategories,
    this.sideMenu,
  });
}
