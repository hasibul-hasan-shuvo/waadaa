import 'package:data/mapper/mapper.dart';
import 'package:data/models/master_product_response.dart';
import 'package:domain/models/category/category.dart';
import 'package:domain/models/product/product.dart';
import 'package:domain/models/product/product_image.dart';
import 'package:domain/models/product/product_type.dart';
import 'package:domain/models/product/product_variant.dart';
import 'package:domain/models/product/product_variant_attribute.dart';
import 'package:domain/models/product/variants.dart';

class ProductDomainMapper implements Mapper<ProductResponse, Product> {
  @override
  Product map(ProductResponse data) {
    ProductType productType = ProductType.values.firstWhere(
      (type) => type.name == data.productType,
      orElse: () => ProductType.single,
    );

    List<ProductImage> images = data.images
            ?.map((image) => ProductImage(
                  id: image.id ?? '',
                  isActive: image.isActive ?? false,
                  url: image.url ?? '',
                ))
            .toList() ??
        [];

    List<Variants> variants = data.variants
            ?.map((variant) => Variants(
                  name: variant.name ?? '',
                  values: variant.values ?? [],
                ))
            .toList() ??
        [];

    List<Category> categories = data.categories
            ?.map((category) => Category(
                  id: category.id ?? '',
                  name: category.name ?? '',
                  level: category.level ?? 0,
                  subcategories: [],
                ))
            .toList() ??
        [];

    List<ProductVariant> variantMappings = data.variantMappings?.map((variant) {
          List<ProductVariantAttribute> attributeValues =
              variant.attributeValues
                      ?.map((attribute) => ProductVariantAttribute(
                            name: attribute.name ?? '',
                            value: attribute.value ?? '',
                          ))
                      .toList() ??
                  [];

          return ProductVariant(
            id: variant.id ?? '',
            attributeValues: attributeValues,
            waadaaSku: variant.waadaaSku ?? '',
            currency: variant.currency ?? '',
            retailPrice: variant.retailPrice ?? 0,
            description: variant.description ?? '',
            estimatedDeliveryTime: variant.estimatedDeliveryTime ?? 0,
            isWaadaaApproved: variant.isWaadaaApproved ?? false,
            initialStockQuantity: variant.initialStockQuantity ?? 0,
            availableStockQuantity: variant.availableStockQuantity ?? 0,
            masterProduct: variant.masterProduct ?? '',
            attributeValue: variant.attributeValue ?? [],
            colorImages: variant.colorImages ?? [],
          );
        }).toList() ??
        [];

    return Product(
      id: data.id ?? '',
      name: data.name ?? '',
      description: data.description ?? '',
      isOverseas: data.isOverseas ?? false,
      productType: productType,
      manufacturer: data.manufacturer ?? '',
      warrantyPolicy: data.warrantyPolicy ?? '',
      returnPolicy: data.returnPolicy ?? '',
      usagePrecaution: data.usagePrecaution ?? '',
      categories: categories,
      brand: data.brand ?? '',
      approvalStatus: data.approvalStatus ?? '',
      slug: data.slug ?? '',
      shippingInformation: data.shippingInformation ?? '',
      variants: variants,
      averageRating: data.averageRating ?? 0,
      images: images,
      variantMappings: variantMappings,
    );
  }
}
