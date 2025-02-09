import 'package:domain/models/category_offer_item.dart';

abstract class HomeRepository {
  Future<List<CategoryOfferItem>> getCategoryOffers();
}
