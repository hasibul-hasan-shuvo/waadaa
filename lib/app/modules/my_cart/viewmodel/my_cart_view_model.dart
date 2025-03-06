import 'package:core/base/base_view_model.dart';
import 'package:di/di.dart';
import 'package:waadaa/app/modules/my_cart/viewmodel/my_cart_state.dart';

@injectable
class MyCartViewModel extends BaseViewModel<MyCartState> {
  MyCartViewModel() : super(MyCartState.initial());
}
