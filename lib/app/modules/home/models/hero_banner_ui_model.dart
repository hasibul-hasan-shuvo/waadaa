import 'package:domain/models/hero_banner_item.dart';

class HeroBannerUiModel {
  final String id;
  final String title;
  final String subTitle;
  final String actionTitle;
  final String actionUrl;
  final String imageUrl;

  HeroBannerUiModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.actionTitle,
    required this.actionUrl,
    required this.imageUrl,
  });

  factory HeroBannerUiModel.fromHeroBannerDomain(HeroBannerItem item) {
    return HeroBannerUiModel(
      id: item.id,
      title: item.title,
      subTitle: item.subTitle,
      actionTitle: item.actionTitle,
      actionUrl: item.actionUrl,
      imageUrl: item.imageUrl,
    );
  }
}
