import 'package:core/config/build_config.dart';

class EndPoints {
  EndPoints._();

  static final adminBaseUrl = BuildConfig.instance.config.adminBaseUrl;
  static final String heroBanners =
      "${adminBaseUrl}configuration/hero-banners-config-list/";
  static String categoryOffersCarousel =
      "${adminBaseUrl}configuration/category-offer-carousel-config-list/";
  static String offersConfigList =
      "${adminBaseUrl}configuration/offer-page-config-List/";
  static String product = 'product/api/products';
}
