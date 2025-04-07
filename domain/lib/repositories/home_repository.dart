import 'package:domain/models/category_offer_item.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:domain/models/offer_banner_item.dart';
import 'package:domain/models/product_model.dart';

abstract class HomeRepository {
  Future<List<HeroBannerItem>> getHomeHeroBanners();

  Future<List<CategoryOfferItem>> getCategoryOffers();

  Future<List<OfferBannerItem>> getOffersConfigList();

  Future<String> getWelcomeReward();

  Future<List<ProductModel>> getLatestProducts();
}
