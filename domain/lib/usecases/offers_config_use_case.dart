import 'package:di/di.dart';
import 'package:domain/models/offer_banner_item.dart';
import 'package:domain/models/offer_banners.dart';
import 'package:domain/repositories/home_repository.dart';

@lazySingleton
class OffersConfigUseCase {
  final HomeRepository _homeRepository;

  OffersConfigUseCase(this._homeRepository);

  Future<OfferBanners> getOffersConfigList() async {
    List<OfferBannerItem> regularBanners = [];
    OfferBannerItem? exclusiveBanner;

    final offerBanners = await _homeRepository.getOffersConfigList();

    for (var offerBanner in offerBanners) {
      if (offerBanner.tagName == "offer_4") {
        exclusiveBanner = offerBanner;
      } else {
        regularBanners.add(offerBanner);
      }
    }

    return OfferBanners(
      regularBanners: regularBanners,
      exclusiveBanner: exclusiveBanner,
    ); // Return as a tuple
  }
}
