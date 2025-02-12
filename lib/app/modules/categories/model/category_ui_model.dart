import 'package:domain/models/category_model.dart';
import 'package:waadaa/app/modules/categories/model/side_menu_ui_model.dart';

class CategoryUIModel {
  String id;
  String name;
  int level;
  String slug;
  List<CategoryUIModel> subcategories;
  SideMenuUIModel? sideMenu;

  CategoryUIModel({
    required this.id,
    required this.name,
    required this.level,
    required this.slug,
    required this.subcategories,
    this.sideMenu,
  });

  factory CategoryUIModel.fromDomain(CategoryModel categoryModel) {
    return CategoryUIModel(
      id: categoryModel.id,
      name: categoryModel.name,
      level: categoryModel.level,
      slug: categoryModel.slug,
      subcategories: categoryModel.subcategories
          .map((e) => CategoryUIModel.fromDomain(e))
          .toList(),
      sideMenu: categoryModel.sideMenu != null
          ? SideMenuUIModel.fromDomain(categoryModel.sideMenu!)
          : null,
    );
  }
}
