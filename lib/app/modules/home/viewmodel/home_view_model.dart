import 'dart:developer';

import 'package:di/di.dart';
import 'package:domain/usecases/hero_banners_use_case.dart';
import 'package:domain/usecases/category_offers_use_case.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel(
    this.heroBannersUseCase,
    this.categoryOffersUseCase,
  ) : super(HomeState.initial());

  final HeroBannersUseCase heroBannersUseCase;
  final CategoryOffersUseCase categoryOffersUseCase;

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
      onStart: () {},
      onComplete: () {},
    );
  }

  void _fetchCategoryOfferList() async {
    callDataService(
      categoryOffersUseCase.getCategoryOffers(),
      onSuccess: (value) {
        updateState(state.updateCategoryOffers(value));
      },
      onStart: () {
        ///start shimmer
      },
      onComplete: () {
        ///stop shimmer
      },
    );
  }

  void _fetchOfferBannersList() async {
    callDataService(
      categoryOffersUseCase.getCategoryOffers(),
      onSuccess: (value) {
        updateState(state.updateCategoryOffers(value));
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
