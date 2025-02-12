import 'package:di/di.dart';
import 'package:domain/models/category_offer_item.dart';
import 'package:domain/repositories/home_repository.dart';

@lazySingleton
class CategoryOffersUseCase {
  final HomeRepository _homeRepository;

  CategoryOffersUseCase(this._homeRepository);

  Future<List<CategoryOfferItem>> getCategoryOffers() {
    return _homeRepository.getCategoryOffers();
  }
}
