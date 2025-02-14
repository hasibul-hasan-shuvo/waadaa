import 'package:data/models/hero_banners_response.dart';
import 'package:domain/models/hero_banner_item.dart';

class HeroBannersMapper {
  static List<HeroBannerItem> mapToDomain(
      List<HeroBannersResponse> responseData) {
    return responseData.map((e) {
      return HeroBannerItem(
        id: e.id ?? "",
        title: e.title ?? "",
        subTitle: e.subtitle ?? "",
        actionTitle: e.actionTitle ?? "",
        actionUrl: e.actionUrl ?? "",
        imageUrl: e.fileUrl ?? "",
      );
    }).toList();
  }
}
