import 'package:di/di.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:domain/repositories/home_repository.dart';

@lazySingleton
class HeroBannersUseCase {
  final HomeRepository _homeRepository;

  HeroBannersUseCase(this._homeRepository);

  Future<List<HeroBannerItem>> getHomeHeroBanners() {
    return _homeRepository.getHomeHeroBanners();
  }
}
