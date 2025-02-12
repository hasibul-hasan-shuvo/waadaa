import 'package:domain/models/category_model.dart';
import 'package:waadaa/app/modules/categories/model/side_menu_ui_model.dart';

class CategoryUIModel {
  String id;
  String name;
  int level;
  String slug;
  List<CategoryUIModel> subcategories;
  SideMenuUIModel? sideMenu;
  bool isSelected;

  CategoryUIModel({
    required this.id,
    required this.name,
    required this.level,
    required this.slug,
    required this.subcategories,
    this.sideMenu,
    this.isSelected = false,
  });

  factory CategoryUIModel.fromDomain(Category category) {
    return CategoryUIModel(
      id: category.id,
      name: category.name,
      level: category.level,
      slug: category.slug,
      subcategories: category.subcategories
          .map((e) => CategoryUIModel.fromDomain(e))
          .toList(),
      sideMenu: category.sideMenu != null
          ? SideMenuUIModel.fromDomain(category.sideMenu!)
          : null,
    );
  }
}
