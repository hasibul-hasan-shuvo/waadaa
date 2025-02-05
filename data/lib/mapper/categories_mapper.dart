import 'package:data/models/category_response.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/models/side_menu_model.dart';

class CategoriesMapper {
  static List<CategoryModel> mapCategories(
      List<CategoryResponseModel> responseData) {
    return (responseData).map((e) {
      return CategoryModel(
        id: e.id,
        name: e.name,
        level: e.level,
        slug: e.slug,
        subcategories:
            e.subcategories.isNotEmpty ? mapCategories(e.subcategories) : [],
        sideMenu: e.sideMenu != null
            ? SideMenuModel(
                id: e.sideMenu!.id,
                type: e.sideMenu!.type,
                title: e.sideMenu!.title,
                targetUrl: e.sideMenu!.targetUrl,
                imageUrl: e.sideMenu!.imageUrl,
                category: e.sideMenu!.category,
              )
            : null,
      );
    }).toList();
  }
}
