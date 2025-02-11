import 'package:data/models/category_offers_response_model.dart';
import 'package:domain/models/category_offer_item.dart';

class CategoryOffersMapper {
  static List<CategoryOfferItem> mapToDomain(
      List<CategoryOffersResponseModel> responseData) {
    return responseData.map((e) {
      return CategoryOfferItem(
        id: e.id ?? "",
        tagName: e.tagName ?? "",
        actionTitle: e.actionTitle ?? "",
        actionUrl: e.actionUrl ?? "",
        imageUrl: e.fileUrl ?? "",
      );
    }).toList();
  }
}
