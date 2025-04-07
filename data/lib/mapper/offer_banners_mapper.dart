import 'package:data/models/offer_banners_response.dart';
import 'package:domain/models/offer_banner_item.dart';

class OfferBannersMapper {
  static List<OfferBannerItem> mapToDomain(OfferBannersResponse responseData) {
    if (responseData.offerConfigList == null ||
        responseData.offerConfigList!.isEmpty) {
      return [];
    }

    return responseData.offerConfigList!.map((e) {
      return OfferBannerItem(
        id: "",
        title: e.title ?? "",
        subTitle: e.subtitle ?? "",
        actionTitle: e.actionTitle ?? "",
        actionUrl: e.actionUrl ?? "",
        fgImageUrl: e.fileUrl ?? "",
        bgImageUrl: e.bgImageUrl ?? "",
        tagName: e.tagName ?? "",
      );
    }).toList();
  }
}
