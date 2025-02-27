import 'package:di/di.dart';
import 'package:domain/models/product/product_variant.dart';
import 'package:domain/models/product/product_with_variants_map_table.dart';
import 'package:domain/repositories/product_repository.dart';

@lazySingleton
class ProductByIdUseCase {
  final ProductRepository _productRepository;

  ProductByIdUseCase(this._productRepository);

  Future<ProductWithVariantsMapTable> getProductById(String id) async {
    final product = await _productRepository.getProductById(id);

    final Map<String, List<ProductVariant>> variantsMapTable = {};
    final Map<String, List<String>> colorImages = {};

    _processVariantMappings(
      variantsMapTable: variantsMapTable,
      colorImages: colorImages,
      variantMappings: product.variantMappings,
    );

    return ProductWithVariantsMapTable(
      product: product,
      colorImages: colorImages,
      variantsMapTable: variantsMapTable,
    );
  }

  void _processVariantMappings({
    required Map<String, List<ProductVariant>> variantsMapTable,
    required Map<String, List<String>> colorImages,
    required List<ProductVariant> variantMappings,
  }) {
    for (final variant in variantMappings) {
      for (final attributeValue in variant.attributeValues) {
        final value = attributeValue.value;

        variantsMapTable.putIfAbsent(value, () => []).add(variant);

        if (attributeValue.name.toLowerCase() == 'color') {
          colorImages.putIfAbsent(value, () => variant.colorImages);
        }
      }
    }
  }
}
