import 'package:di/di.dart';
import 'package:domain/models/product/product_with_variants_map_table.dart';
import 'package:domain/repositories/product_repository.dart';

@lazySingleton
class ProductByIdUseCase {
  final ProductRepository _productRepository;

  ProductByIdUseCase(this._productRepository);

  Future<ProductWithVariantsMapTable> getProductById(String id) async {
    return _productRepository.getProductById(id).then((product) {
      return ProductWithVariantsMapTable(
        product: product,
        variantsMapTable: {},
      );
    });
  }
}
