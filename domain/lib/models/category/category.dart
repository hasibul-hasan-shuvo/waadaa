import 'package:domain/models/category/side_menu.dart';

class Category {
  String id;
  String name;
  int level;
  List<Category> subcategories;
  SideMenu? sideMenu;

  Category({
    required this.id,
    required this.name,
    required this.level,
    required this.subcategories,
    this.sideMenu,
  });
}
