import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel() : super(HomeState.initial());

  void increment() {
    updateState(state.increment());
  }

  void updateMessage() {
    updateState(state.updateMessage("This is the message"));
  }
}
