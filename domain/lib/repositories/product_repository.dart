import 'package:domain/models/product/product.dart';

abstract class ProductRepository {
  Future<Product> getProductById(String id);
}
