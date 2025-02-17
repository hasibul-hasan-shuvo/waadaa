import 'package:domain/models/category_offer_item.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:domain/models/offer_banner_item.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class HomeState extends BaseState {
  int counter = 0;
  int heroBannerIndex = 0;
  List<HeroBannerItem>? heroBanners;
  List<CategoryOfferItem>? categoryOffers;
  OfferBannerItem? exclusiveBanner;
  List<OfferBannerItem>? regularBanners;

  HomeState({
    super.status,
    this.counter = 0,
    this.heroBannerIndex = 0,
    this.heroBanners,
    this.categoryOffers,
    this.exclusiveBanner,
    this.regularBanners,
  });

  HomeState.initial();

  @override
  HomeState copyWith({
    BaseStatus? status,
    int? counter,
    int? heroBannerIndex,
    List<HeroBannerItem>? heroBanners,
    List<CategoryOfferItem>? categoryOffers,
    OfferBannerItem? exclusiveBanner,
    List<OfferBannerItem>? regularBanners,
  }) {
    return HomeState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      heroBannerIndex: heroBannerIndex ?? this.heroBannerIndex,
      heroBanners: heroBanners ?? this.heroBanners,
      categoryOffers: categoryOffers ?? this.categoryOffers,
      exclusiveBanner: exclusiveBanner ?? this.exclusiveBanner,
      regularBanners: regularBanners ?? this.regularBanners,
    );
  }

  HomeState increment() {
    return copyWith(counter: counter + 1);
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
}
