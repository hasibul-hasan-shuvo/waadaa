import 'package:di/configure_dependencies.dart';
import 'package:di/di.dart';
import 'package:domain/repositories/home_repository.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel() : super(HomeState.initial());

  HomeRepository repository = getIt<HomeRepository>();

  @override
  void onViewReady() {
    super.onViewReady();

    fetchCategoryOfferList();
  }

  void increment() {
    updateState(state.increment());
  }

  void updateHeroBannerIndex(int index) {
    updateState(state.updateHeroBannerIndex(index));
  }

  void fetchCategoryOfferList() async {
    final categoryOffers = await repository.getCategoryOffers();

    updateState(state.updateCategoryOffers(categoryOffers));
  }
}
