import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';

class MyCartState extends BaseState {
  MyCartState({
    super.status,
  });

  MyCartState.initial();

  @override
  MyCartState copyWith({
    BaseStatus? status,
  }) {
    return MyCartState(
      status: status ?? this.status,
    );
  }
}
