import 'package:data/models/category_offers_response.dart';
import 'package:data/models/hero_banners_response.dart';
import 'package:data/models/offer_banners_response.dart';

abstract class HomeRemoteDataSource {
  Future<List<HeroBannersResponse>> getHeroBanners();

  Future<List<CategoryOffersResponse>> getCategoryOffers();

  Future<OfferBannersResponse> getOffersConfigList();
}
