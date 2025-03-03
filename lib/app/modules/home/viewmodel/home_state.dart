import 'package:domain/models/category_offer_item.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:domain/models/offer_banner_item.dart';
import 'package:domain/models/product_model.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class HomeState extends BaseState {
  String? rewardText;
  int heroBannerIndex = 0;
  List<HeroBannerItem>? heroBanners;
  List<CategoryOfferItem>? categoryOffers;
  OfferBannerItem? exclusiveBanner;
  List<OfferBannerItem>? regularBanners;
  List<ProductModel>? latestProducts;

  HomeState({
    super.status,
    this.rewardText,
    this.heroBannerIndex = 0,
    this.heroBanners,
    this.categoryOffers,
    this.exclusiveBanner,
    this.regularBanners,
    this.latestProducts,
  });

  HomeState.initial();

  @override
  HomeState copyWith({
    BaseStatus? status,
    String? rewardText,
    int? heroBannerIndex,
    List<HeroBannerItem>? heroBanners,
    List<CategoryOfferItem>? categoryOffers,
    OfferBannerItem? exclusiveBanner,
    List<OfferBannerItem>? regularBanners,
    List<ProductModel>? latestProducts,
  }) {
    return HomeState(
      status: status ?? this.status,
      rewardText: rewardText ?? this.rewardText,
      heroBannerIndex: heroBannerIndex ?? this.heroBannerIndex,
      heroBanners: heroBanners ?? this.heroBanners,
      categoryOffers: categoryOffers ?? this.categoryOffers,
      exclusiveBanner: exclusiveBanner ?? this.exclusiveBanner,
      regularBanners: regularBanners ?? this.regularBanners,
      latestProducts: latestProducts ?? this.latestProducts,
    );
  }

  HomeState updateRewardText(String rewardTxt) {
    return copyWith(rewardText: rewardTxt);
  }

  HomeState updateHeroBannerIndex(int index) {
    return copyWith(heroBannerIndex: index);
  }

  HomeState updateHeroBanners(List<HeroBannerItem> heroBanners) {
    return copyWith(heroBanners: heroBanners);
  }

  HomeState updateCategoryOffers(List<CategoryOfferItem> categoryOffers) {
    return copyWith(categoryOffers: categoryOffers);
  }

  HomeState updateExclusiveBanner(OfferBannerItem? exclusiveBanner) {
    return copyWith(exclusiveBanner: exclusiveBanner);
  }

  HomeState updateRegularBanners(List<OfferBannerItem> regularBanners) {
    return copyWith(regularBanners: regularBanners);
  }

  HomeState updateLatestProducts(List<ProductModel> latestProducts) {
    return copyWith(latestProducts: latestProducts);
  }
}
