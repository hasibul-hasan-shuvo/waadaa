import 'package:data/models/category_offers_response_model.dart';
import 'package:data/models/hero_banners_response_model.dart';
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
  Future<List<HeroBannersResponseModel>> getHeroBannersFromRemote() async {
    final endpoint = EndPoints.heroBanners;
    var dioCall = client.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseBannersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<HeroBannersResponseModel> _parseBannersResponse(
      NetworkResponse response) {
    List<dynamic> data = response.data;

    final List<HeroBannersResponseModel> heroBanners =
        data.map((item) => HeroBannersResponseModel.fromJson(item)).toList();

    return heroBanners;
  }

  @override
  Future<List<CategoryOffersResponseModel>>
      getCategoryOffersFromRemote() async {
    final endpoint = EndPoints.categoryOffersCarousel;
    var dioCall = client.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseCategoryOffersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<CategoryOffersResponseModel> _parseCategoryOffersResponse(
      NetworkResponse response) {
    List<dynamic> data = response.data;

    final List<CategoryOffersResponseModel> categoryOffers =
        data.map((item) => CategoryOffersResponseModel.fromJson(item)).toList();

    return categoryOffers;
  }
}
