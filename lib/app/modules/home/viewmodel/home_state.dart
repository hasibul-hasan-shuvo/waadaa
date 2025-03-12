import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';
import 'package:waadaa/app/modules/home/models/category_offer_ui_model.dart';
import 'package:waadaa/app/modules/home/models/hero_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/models/offer_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';

class HomeState extends BaseState {
  String? rewardText;
  int heroBannerIndex = 0;
  List<HeroBannerUiModel>? heroBanners;
  List<CategoryOfferUiModel>? categoryOffers;
  OfferBannerUiModel? exclusiveBanner;
  List<OfferBannerUiModel>? regularBanners;
  List<ProductUiModel>? latestProducts;
  bool isHeroBannersLoading = false;

  HomeState({
    super.status,
    this.rewardText,
    this.heroBanners,
    this.categoryOffers,
    this.exclusiveBanner,
    this.regularBanners,
    this.latestProducts,
    this.isHeroBannersLoading = false,
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
    bool? isHeroBannersLoading,
  }) {
    return HomeState(
      status: status ?? this.status,
      rewardText: rewardText ?? this.rewardText,
      heroBanners: heroBanners ?? this.heroBanners,
      categoryOffers: categoryOffers ?? this.categoryOffers,
      exclusiveBanner: exclusiveBanner ?? this.exclusiveBanner,
      regularBanners: regularBanners ?? this.regularBanners,
      latestProducts: latestProducts ?? this.latestProducts,
      isHeroBannersLoading: isHeroBannersLoading ?? this.isHeroBannersLoading,
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

  HomeState updateHeroBannersLoading(bool value) {
    return copyWith(isHeroBannersLoading: value);
  }
}
