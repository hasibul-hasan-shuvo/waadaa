class CategoryResponseModel {
  final String id;
  final String name;
  final int level;
  final String slug;
  final List<CategoryResponseModel> subcategories;
  final SideMenuResponseModel? sideMenu;

  CategoryResponseModel({
    required this.id,
    required this.name,
    required this.level,
    required this.slug,
    required this.subcategories,
    this.sideMenu,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    // Parse subcategories if available, otherwise use an empty list.
    var subcategoriesJson = json['subcategories'] as List<dynamic>?;

    List<CategoryResponseModel> subcategoriesList = subcategoriesJson != null
        ? subcategoriesJson
            .map((item) => CategoryResponseModel.fromJson(item))
            .toList()
        : [];

    return CategoryResponseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      level: json['level'] as int,
      slug: json['slug'] as String,
      subcategories: subcategoriesList,
      sideMenu: json['side_menu'] != null
          ? SideMenuResponseModel.fromJson(
              json['side_menu'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'slug': slug,
      'subcategories': subcategories.map((e) => e.toJson()).toList(),
      'side_menu': sideMenu?.toJson(),
    };
  }
}

class SideMenuResponseModel {
  final String id;
  final String? type;
  final String title;
  final String targetUrl;
  final String imageUrl;
  final String category;

  SideMenuResponseModel({
    required this.id,
    this.type,
    required this.title,
    required this.targetUrl,
    required this.imageUrl,
    required this.category,
  });

  factory SideMenuResponseModel.fromJson(Map<String, dynamic> json) {
    return SideMenuResponseModel(
      id: json['id'] as String,
      type: json['type'] as String?,
      title: json['title'] as String,
      targetUrl: json['target_url'] as String,
      imageUrl: json['image_url'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'target_url': targetUrl,
      'image_url': imageUrl,
      'category': category,
    };
  }
}
