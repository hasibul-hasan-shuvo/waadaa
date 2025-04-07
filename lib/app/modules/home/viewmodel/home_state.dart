import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';
import 'package:waadaa/app/modules/home/models/category_offer_ui_model.dart';
import 'package:waadaa/app/modules/home/models/hero_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/models/offer_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';

class HomeState extends BaseState {
  String? rewardText;
  List<HeroBannerUiModel>? heroBanners;
  List<CategoryOfferUiModel>? categoryOffers;
  OfferBannerUiModel? exclusiveBanner;
  List<OfferBannerUiModel>? regularBanners;
  List<ProductUiModel>? latestProducts;
  bool isRewardLoading = false;
  bool isHeroBannersLoading = false;
  bool isOfferBannersLoading = false;
  bool isCategoryOffersLoading = false;
  bool isLatestProductsLoading = false;

  HomeState({
    super.status,
    this.rewardText,
    this.heroBanners,
    this.categoryOffers,
    this.exclusiveBanner,
    this.regularBanners,
    this.latestProducts,
    this.isRewardLoading = false,
    this.isHeroBannersLoading = false,
    this.isOfferBannersLoading = false,
    this.isCategoryOffersLoading = false,
    this.isLatestProductsLoading = false,
  });

  HomeState.initial();

  @override
  HomeState copyWith({
    BaseStatus? status,
    String? rewardText,
    List<HeroBannerUiModel>? heroBanners,
    List<CategoryOfferUiModel>? categoryOffers,
    OfferBannerUiModel? exclusiveBanner,
    List<OfferBannerUiModel>? regularBanners,
    List<ProductUiModel>? latestProducts,
    bool? isRewardLoading,
    bool? isHeroBannersLoading,
    bool? isOfferBannersLoading,
    bool? isCategoryOffersLoading,
    bool? isLatestProductsLoading,
  }) {
    return HomeState(
      status: status ?? this.status,
      rewardText: rewardText ?? this.rewardText,
      heroBanners: heroBanners ?? this.heroBanners,
      categoryOffers: categoryOffers ?? this.categoryOffers,
      exclusiveBanner: exclusiveBanner ?? this.exclusiveBanner,
      regularBanners: regularBanners ?? this.regularBanners,
      latestProducts: latestProducts ?? this.latestProducts,
      isRewardLoading: isRewardLoading ?? this.isRewardLoading,
      isHeroBannersLoading: isHeroBannersLoading ?? this.isHeroBannersLoading,
      isOfferBannersLoading:
          isOfferBannersLoading ?? this.isOfferBannersLoading,
      isCategoryOffersLoading:
          isCategoryOffersLoading ?? this.isCategoryOffersLoading,
      isLatestProductsLoading:
          isLatestProductsLoading ?? this.isLatestProductsLoading,
    );
  }

  HomeState updateRewardText(String rewardTxt) {
    return copyWith(rewardText: rewardTxt);
  }

  HomeState updateHeroBanners(List<HeroBannerUiModel> heroBanners) {
    return copyWith(heroBanners: heroBanners);
  }

  HomeState updateCategoryOffers(List<CategoryOfferUiModel> categoryOffers) {
    return copyWith(categoryOffers: categoryOffers);
  }

  HomeState updateExclusiveBanner(OfferBannerUiModel? exclusiveBanner) {
    return copyWith(exclusiveBanner: exclusiveBanner);
  }

  HomeState updateRegularBanners(List<OfferBannerUiModel> regularBanners) {
    return copyWith(regularBanners: regularBanners);
  }

  HomeState updateLatestProducts(List<ProductUiModel> latestProducts) {
    return copyWith(latestProducts: latestProducts);
  }

  HomeState updateRewardLoaderState(bool value) {
    return copyWith(isRewardLoading: value);
  }

  HomeState updateHeroBannersLoaderState(bool value) {
    return copyWith(isHeroBannersLoading: value);
  }

  HomeState updateOfferBannersLoaderState(bool value) {
    return copyWith(isOfferBannersLoading: value);
  }

  HomeState updateCategoryOffersLoaderState(bool value) {
    return copyWith(isCategoryOffersLoading: value);
  }

  HomeState updateLatestProductsLoaderState(bool value) {
    return copyWith(isLatestProductsLoading: value);
  }
}
