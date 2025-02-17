import 'dart:developer';

import 'package:di/di.dart';
import 'package:domain/usecases/hero_banners_use_case.dart';
import 'package:domain/usecases/category_offers_use_case.dart';
import 'package:domain/usecases/offers_config_use_case.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel(
    this.heroBannersUseCase,
    this.categoryOffersUseCase,
    this.offersConfigUseCase,
  ) : super(HomeState.initial());

  final HeroBannersUseCase heroBannersUseCase;
  final CategoryOffersUseCase categoryOffersUseCase;
  final OffersConfigUseCase offersConfigUseCase;

  @override
  void onViewReady() {
    super.onViewReady();

    _fetchHeroBannerList();
    _fetchCategoryOfferList();
    _fetchOfferBannersList();
  }

  void increment() {
    updateState(state.increment());
  }

  void updateHeroBannerIndex(int index) {
    updateState(state.updateHeroBannerIndex(index));
  }

  void _fetchHeroBannerList() {
    callDataService(
      heroBannersUseCase.getHomeHeroBanners(),
      onSuccess: (value) {
        updateState(state.updateHeroBanners(value));
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
        updateState(state.updateCategoryOffers(value));
      },
    );
  }

  void _fetchOfferBannersList() async {
    ///separate one response model to two different states
    callDataService(
      offersConfigUseCase.getOffersConfigList(),
      onSuccess: (value) {
        state.updateRegularBanners(value.$1);
        state.updateExclusiveBanner(value.$2);
      },
      onStart: () {
        ///start shimmer
      },
      onComplete: () {
        ///stop shimmer
      },
    );
  }

  void onViewAllClicked() {
    log("view all clicked");
  }
}
