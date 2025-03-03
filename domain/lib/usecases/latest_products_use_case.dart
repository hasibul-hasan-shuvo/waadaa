import 'package:di/di.dart';
import 'package:domain/models/product_model.dart';
import 'package:domain/repositories/home_repository.dart';

@lazySingleton
class LatestProductsUseCase {
  final HomeRepository _homeRepository;

  LatestProductsUseCase(this._homeRepository);

  Future<List<ProductModel>> getLatestProducts() {
    return _homeRepository.getLatestProducts();
  }
}
