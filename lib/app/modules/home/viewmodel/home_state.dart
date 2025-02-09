import 'package:domain/models/category_offer_item.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class HomeState extends BaseState {
  int counter = 0;
  int heroBannerIndex = 0;
  List<CategoryOfferItem>? categoryOffers;

  HomeState({
    super.status,
    this.counter = 0,
    this.heroBannerIndex = 0,
    this.categoryOffers,
  });

  HomeState.initial();

  @override
  HomeState copyWith({
    BaseStatus? status,
    int? counter,
    int? heroBannerIndex,
    List<CategoryOfferItem>? categoryOffers,
  }) {
    return HomeState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      heroBannerIndex: heroBannerIndex ?? this.heroBannerIndex,
      categoryOffers: categoryOffers ?? this.categoryOffers,
    );
  }

  HomeState increment() {
    return copyWith(counter: counter + 1);
  }

  HomeState updateHeroBannerIndex(int index) {
    return copyWith(heroBannerIndex: index);
  }

  HomeState updateCategoryOffers(List<CategoryOfferItem> categoryOffers) {
    return copyWith(categoryOffers: categoryOffers);
  }
}
