import 'package:domain/models/category/side_menu.dart';

class Category {
  String id;
  String name;
  int level;
  String slug;
  List<Category> subcategories;
  SideMenu? sideMenu;

  Category({
    required this.id,
    required this.name,
    required this.level,
    required this.slug,
    required this.subcategories,
    this.sideMenu,
  });
}
