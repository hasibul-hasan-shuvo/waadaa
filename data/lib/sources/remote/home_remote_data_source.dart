import 'package:data/models/category_offers_response.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryOffersResponseModel>> getCategoryOffersFromRemote();
}
