import 'dart:developer';

import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:domain/usecases/category_offers_use_case.dart';
import 'package:domain/usecases/hero_banners_use_case.dart';
import 'package:domain/usecases/latest_products_use_case.dart';
import 'package:domain/usecases/offers_config_use_case.dart';
import 'package:domain/usecases/welcome_reward_use_case.dart';
import 'package:waadaa/app/modules/home/models/category_offer_ui_model.dart';
import 'package:waadaa/app/modules/home/models/hero_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/models/offer_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel(
    this.heroBannersUseCase,
    this.categoryOffersUseCase,
    this.offersConfigUseCase,
    this.welcomeRewardUseCase,
    this.latestProductsUseCase,
  ) : super(HomeState.initial());

  final HeroBannersUseCase heroBannersUseCase;
  final CategoryOffersUseCase categoryOffersUseCase;
  final OffersConfigUseCase offersConfigUseCase;
  final WelcomeRewardUseCase welcomeRewardUseCase;
  final LatestProductsUseCase latestProductsUseCase;

  @override
  void onViewReady() {
    super.onViewReady();

    _fetchHeroBannerList();
    _fetchCategoryOfferList();
    _fetchOfferBannersList();
    _fetchRewardText();
    _fetchLatestProducts();
  }

  void updateHeroBannerIndex(int index) {
    updateState(state.updateHeroBannerIndex(index));
  }

  void _fetchHeroBannerList() {
    callDataService(
      heroBannersUseCase.getHomeHeroBanners(),
      onSuccess: (value) {
        updateState(state.updateHeroBanners(
          value.map((e) => HeroBannerUiModel.fromHeroBannerDomain(e)).toList(),
        ));
      },
      onStart: () {
        ///start shimmer
      },
      onComplete: () {
        ///stop shimmer
      },
    );
  }

  void _fetchCategoryOfferList() async {
    callDataService(
      categoryOffersUseCase.getCategoryOffers(),
      onSuccess: (value) {
        updateState(state.updateCategoryOffers(
          value
              .map((e) => CategoryOfferUiModel.fromCategoryOfferDomain(e))
              .toList(),
        ));
      },
    );
  }

  void _fetchOfferBannersList() async {
    ///separate one response model to two different states
    callDataService(
      offersConfigUseCase.getOffersConfigList(),
      onSuccess: (value) {
        updateState(state.updateRegularBanners(
          value.regularBanners
              .map((e) => OfferBannerUiModel.fromOfferBannerDomain(e))
              .toList(),
        ));
        updateState(state.updateExclusiveBanner(
          (value.exclusiveBanner == null)
              ? null
              : OfferBannerUiModel.fromOfferBannerDomain(
                  value.exclusiveBanner!),
        ));
      },
      onStart: () {
        ///start shimmer
      },
      onComplete: () {
        ///stop shimmer
      },
    );
  }

  _fetchRewardText() {
    callDataService(
      welcomeRewardUseCase.getWelcomeReward(),
      onSuccess: (value) {
        updateState(state.updateRewardText(value));
      },
    );
  }

  void _fetchLatestProducts() async {
    ///separate one response model to two different states
    callDataService(
      latestProductsUseCase.getLatestProducts(),
      onSuccess: (value) {
        updateState(state.updateLatestProducts(
          value.map((e) => ProductUiModel.fromProductDomain(e)).toList(),
        ));
      },
    );
  }

  void onViewAllClicked() {
    log("view all clicked");
  }
}
