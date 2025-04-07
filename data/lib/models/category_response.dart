class CategoryResponse {
  CategoryResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    level = json['level'];
    root = json['root'];
    sideMenu = json['side_menu'];

    var subcategoriesJson = json['subcategories'] as List<dynamic>?;

    subcategories = subcategoriesJson != null
        ? subcategoriesJson
            .map((item) => CategoryResponse.fromJson(item))
            .toList()
        : [];
  }

  String? id;
  String? name;
  String? parent;
  int? level;
  String? root;
  List<CategoryResponse>? subcategories;
  SideMenuResponse? sideMenu;
}

class SideMenuResponse {
  final String id;
  final String? type;
  final String title;
  final String targetUrl;
  final String imageUrl;
  final String category;

  SideMenuResponse({
    required this.id,
    this.type,
    required this.title,
    required this.targetUrl,
    required this.imageUrl,
    required this.category,
  });

  factory SideMenuResponse.fromJson(Map<String, dynamic> json) {
    return SideMenuResponse(
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
