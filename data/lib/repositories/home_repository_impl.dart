import 'package:data/mapper/category_offers_mapper.dart';
import 'package:data/sources/remote/home_remote_data_source.dart';
import 'package:di/configure_dependencies.dart';
import 'package:di/di.dart';
import 'package:domain/models/category_offer_item.dart';
import 'package:domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource remoteDataSource = getIt<HomeRemoteDataSource>();

  @override
  Future<List<CategoryOfferItem>> getCategoryOffers() async {
    final offers = await remoteDataSource.getCategoryOffersFromRemote();
    return CategoryOffersMapper.mapToDomain(offers);
  }
}
