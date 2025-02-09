import 'package:data/models/category_offers_response.dart';
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

    final categoryOffers = response.data
        .map((e) =>
            CategoryOffersResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return categoryOffers;
  }
}
