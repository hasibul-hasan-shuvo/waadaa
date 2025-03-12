import 'package:domain/models/offer_banner_item.dart';

class OfferBannerUiModel {
  final String id;
  final String title;
  final String subTitle;
  final String actionTitle;
  final String actionUrl;
  final String fgImageUrl;
  final String bgImageUrl;
  final String tagName;

  OfferBannerUiModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.actionTitle,
    required this.actionUrl,
    required this.fgImageUrl,
    required this.bgImageUrl,
    required this.tagName,
  });

  factory OfferBannerUiModel.fromOfferBannerDomain(OfferBannerItem item) {
    return OfferBannerUiModel(
      id: item.id,
      title: item.title,
      subTitle: item.subTitle,
      actionTitle: item.actionTitle,
      actionUrl: item.actionUrl,
      fgImageUrl: item.fgImageUrl,
      bgImageUrl: item.bgImageUrl,
      tagName: item.tagName,
    );
  }

  bool get isEmpty => id.isEmpty;
}
