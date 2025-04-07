import 'package:data/models/category_offers_response.dart';
import 'package:data/models/hero_banners_response.dart';
import 'package:data/models/offer_banners_response.dart';
import 'package:data/sources/remote/base/base_remote_data_source.dart';
import 'package:data/sources/remote/clients/end_points.dart';
import 'package:data/sources/remote/clients/models/NetworkResponse.dart';
import 'package:data/sources/remote/home_remote_data_source.dart';
import 'package:di/di.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends BaseRemoteDataSource
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(super.client);

  @override
  Future<List<HeroBannersResponse>> getHeroBanners() async {
    String endpoint = EndPoints.heroBanners;
    final apiCall = client.get(endpoint);

    try {
      return callApiWithErrorParser(apiCall)
          .then((response) => _parseBannersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<HeroBannersResponse> _parseBannersResponse(NetworkResponse response) {
    List<HeroBannersResponse> heroBanners = [];

    if (response.data is List) {
      List<dynamic> data = response.data;
      heroBanners =
          data.map((item) => HeroBannersResponse.fromJson(item)).toList();
    }
    return heroBanners;
  }

  @override
  Future<List<CategoryOffersResponse>> getCategoryOffers() async {
    final endpoint = EndPoints.categoryOffersCarousel;
    var apiCall = client.get(endpoint);

    try {
      return callApiWithErrorParser(apiCall)
          .then((response) => _parseCategoryOffersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<CategoryOffersResponse> _parseCategoryOffersResponse(
      NetworkResponse response) {
    List<CategoryOffersResponse> categoryOffers = [];

    if (response.data is List) {
      List<dynamic> data = response.data;
      categoryOffers =
          data.map((item) => CategoryOffersResponse.fromJson(item)).toList();
    }
    return categoryOffers;
  }

  @override
  Future<OfferBannersResponse> getOffersConfigList() {
    final endpoint = EndPoints.offersConfigList;
    var apiCall = client.get(endpoint);

    try {
      return callApiWithErrorParser(apiCall)
          .then((response) => _parseOffersConfigResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  OfferBannersResponse _parseOffersConfigResponse(NetworkResponse response) {
    return OfferBannersResponse.fromJson(response.data);
  }
}
