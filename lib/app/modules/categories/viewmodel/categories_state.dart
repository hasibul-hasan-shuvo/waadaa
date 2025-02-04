import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class CategoriesState extends BaseState {

  CategoriesState({
    super.status,
  });

  CategoriesState.initial();

  @override
  CategoriesState copyWith({
    BaseStatus? status,
  }) {
    return CategoriesState(
      status: status ?? this.status,
    );
  }
}
