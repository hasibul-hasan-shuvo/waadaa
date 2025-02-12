import 'package:data/mapper/mapper.dart';
import 'package:data/models/category_response.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/models/side_menu_model.dart';

class CategoriesDomainMapper
    implements Mapper<List<CategoryResponse>, List<Category>> {
  @override
  List<Category> map(List<CategoryResponse> data) {
    return data.map((e) {
      return Category(
        id: e.id,
        name: e.name,
        level: e.level,
        slug: e.slug,
        subcategories: e.subcategories.isNotEmpty ? map(e.subcategories) : [],
        sideMenu: e.sideMenu != null
            ? SideMenu(
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
