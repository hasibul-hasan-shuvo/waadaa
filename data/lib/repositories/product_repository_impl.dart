import 'package:core/exceptions/not_found_exception.dart';
import 'package:data/mapper/product_domain_mapper.dart';
import 'package:data/sources/remote/product/product_remote_data_source.dart';
import 'package:di/di.dart';
import 'package:domain/models/product/product.dart';
import 'package:domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productDataSource;

  ProductRepositoryImpl(this._productDataSource);

  @override
  Future<Product> getProductById(String id) async {
    return _productDataSource.getProductById(id).then((response) {
      if (response.product == null) {
        throw NotFoundException('Product not found', '404');
      }

      return ProductDomainMapper().map(response.product!);
    });
  }
}
