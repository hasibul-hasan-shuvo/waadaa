import 'package:data/models/category_offers_response_model.dart';
import 'package:data/models/hero_banners_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HeroBannersResponseModel>> getHeroBanners();

  Future<List<CategoryOffersResponseModel>> getCategoryOffers();
}
