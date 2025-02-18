import 'package:domain/models/offer_banner_item.dart';

class OfferBanners {
  List<OfferBannerItem> regularBanners;
  OfferBannerItem? exclusiveBanner;

  OfferBanners({
    required this.regularBanners,
    this.exclusiveBanner,
  });
}
