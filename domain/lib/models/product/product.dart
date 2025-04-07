import 'package:domain/models/category/category.dart';
import 'package:domain/models/product/product_image.dart';
import 'package:domain/models/product/product_type.dart';
import 'package:domain/models/product/product_variant.dart';
import 'package:domain/models/product/variants.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.isOverseas,
    required this.productType,
    required this.manufacturer,
    required this.warrantyPolicy,
    required this.returnPolicy,
    required this.usagePrecaution,
    required this.categories,
    required this.brand,
    required this.approvalStatus,
    required this.slug,
    required this.shippingInformation,
    required this.variants,
    required this.averageRating,
    required this.images,
    required this.variantMappings,
  });

  final String id;
  final String name;
  final String description;
  final bool isOverseas;
  final ProductType productType;
  final String manufacturer;
  final String warrantyPolicy;
  final String returnPolicy;
  final String usagePrecaution;
  final List<Category> categories;
  final String brand;
  final String approvalStatus;
  final String slug;
  final String shippingInformation;
  final List<Variants> variants;
  final double averageRating;
  final List<ProductImage> images;
  final List<ProductVariant> variantMappings;
}
