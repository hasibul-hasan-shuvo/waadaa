import 'package:domain/models/category_offer_item.dart';

class CategoryOfferUiModel {
  String id;
  String tagName;
  String actionTitle;
  String actionUrl;
  String imageUrl;

  CategoryOfferUiModel({
    required this.id,
    required this.tagName,
    required this.actionTitle,
    required this.actionUrl,
    required this.imageUrl,
  });

  factory CategoryOfferUiModel.fromCategoryOfferDomain(CategoryOfferItem item) {
    return CategoryOfferUiModel(
      id: item.id,
      tagName: item.tagName,
      actionTitle: item.actionTitle,
      actionUrl: item.actionUrl,
      imageUrl: item.imageUrl,
    );
  }
}