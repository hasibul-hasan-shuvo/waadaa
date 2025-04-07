import 'package:domain/models/product/product.dart';

class ProductInfoUiModel {
  final String name;
  final String description;
  final String brandName;
  final String rating;

  ProductInfoUiModel({
    required this.name,
    required this.description,
    required this.brandName,
    required this.rating,
  });

  ProductInfoUiModel.empty()
      : name = '',
        description = '',
        brandName = '',
        rating = '';

  factory ProductInfoUiModel.fromProduct(Product product) {
    return ProductInfoUiModel(
      name: product.name,
      description: product.description,
      brandName: product.brand,
      rating: product.averageRating.toString(),
    );
  }

  bool get isEmpty => name.isEmpty;
}
