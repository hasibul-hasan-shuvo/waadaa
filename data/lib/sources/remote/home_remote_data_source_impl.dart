import 'dart:developer';

import 'package:data/models/category_offers_response_model.dart';
import 'package:data/sources/remote/base/base_remote_data_source.dart';
import 'package:data/sources/remote/home_remote_data_source.dart';
import 'package:di/di.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends BaseRemoteDataSource
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(super.client);

  @override
  Future<List<CategoryOffersResponseModel>>
      getCategoryOffersFromRemote() async {
    final response = await callApiWithErrorParser(
      client.get(
          "https://admin.dev.waadaa.app/api/configuration/category-offer-carousel-config-list/"),
    );

    log("Response data type ------- ${response.data.runtimeType}");

    List<dynamic> data = response.data;

    final List<CategoryOffersResponseModel> categoryOffers =
        data.map((item) => CategoryOffersResponseModel.fromJson(item)).toList();

    return categoryOffers;
  }
}
