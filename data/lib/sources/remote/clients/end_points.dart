import 'package:core/config/build_config.dart';

class EndPoints {
  EndPoints._();

  static final adminBaseUrl = BuildConfig.instance.config.adminBaseUrl;
  static final String heroBanners =
      "$adminBaseUrl/api/configuration/hero-banners-config-list/";
  static String categoryOffersCarousel =
      "$adminBaseUrl/api/configuration/category-offer-carousel-config-list/";
  static String product = 'product/api/products';
}
