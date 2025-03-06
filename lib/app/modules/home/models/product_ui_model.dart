import 'package:domain/models/product_model.dart';

class ProductUiModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String currency;

  ProductUiModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.currency,
  });

  factory ProductUiModel.fromProductDomain(ProductModel item) {
    return ProductUiModel(
      id: item.id,
      name: item.name,
      description: item.description,
      imageUrl: item.imageUrl,
      price: item.price,
      currency: item.currency,
    );
  }
}
