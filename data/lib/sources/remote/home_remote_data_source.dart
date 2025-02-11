import 'package:data/models/category_offers_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryOffersResponseModel>> getCategoryOffersFromRemote();
}
