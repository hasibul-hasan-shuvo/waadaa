import 'package:domain/models/product/product_variant_attribute.dart';

class ProductVariant {
  ProductVariant({
    required this.id,
    required this.attributeValues,
    required this.waadaaSku,
    required this.currency,
    required this.retailPrice,
    required this.description,
    required this.estimatedDeliveryTime,
    required this.isWaadaaApproved,
    required this.initialStockQuantity,
    required this.availableStockQuantity,
    required this.masterProduct,
    required this.attributeValue,
    required this.colorImages,
  });

  final String id;
  final List<ProductVariantAttribute> attributeValues;
  final String waadaaSku;
  final String currency;
  final double retailPrice;
  final String description;
  final int estimatedDeliveryTime;
  final bool isWaadaaApproved;
  final int initialStockQuantity;
  final int availableStockQuantity;
  final String masterProduct;
  final List<String> attributeValue;
  final List<String> colorImages;
}
