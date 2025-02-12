class SideMenu {
  String id;
  String? type;
  String title;
  String targetUrl;
  String imageUrl;
  String category;

  SideMenu({
    required this.id,
    this.type,
    required this.title,
    required this.targetUrl,
    required this.imageUrl,
    required this.category,
  });
}
