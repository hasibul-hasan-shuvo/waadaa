import 'package:core/base/base_view_model.dart';
import 'package:core/widgets/bottom_navbar/models/bottom_navbar_item.dart';
import 'package:di/di.dart';
import 'package:waadaa/app/modules/main/models/bottom_nav_items.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_state.dart';

@injectable
class MainViewModel extends BaseViewModel<MainState> {
  MainViewModel() : super(MainState.initial());

  void onNavItemSelect(BottomNavbarItem<BottomNavItems> selectedItem) {
    updateState(state.updateSelectedNavbarItem(selectedItem));
  }
}
