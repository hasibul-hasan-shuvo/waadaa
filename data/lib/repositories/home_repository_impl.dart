import 'package:data/mapper/category_offers_mapper.dart';
import 'package:data/mapper/hero_banners_mapper.dart';
import 'package:data/sources/remote/home_remote_data_source.dart';
import 'package:di/di.dart';
import 'package:domain/models/category_offer_item.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<HeroBannerItem>> getHomeHeroBanners() {
    return _remoteDataSource.getHeroBanners().then(
          (value) => HeroBannersMapper.mapToDomain(value),
        );
  }

  @override
  Future<List<CategoryOfferItem>> getCategoryOffers() {
    return _remoteDataSource.getCategoryOffers().then(
          (value) => CategoryOffersMapper.mapToDomain(value),
        );
  }
}
