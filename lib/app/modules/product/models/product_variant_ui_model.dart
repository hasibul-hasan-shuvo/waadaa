class ProductVariantUiModel {
  final String name;
  final String imageUrl;
  final bool isAvailable;

  ProductVariantUiModel({
    required this.name,
    required this.imageUrl,
    this.isAvailable = false,
  });
}
