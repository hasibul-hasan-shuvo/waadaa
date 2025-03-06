import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';

class BrandsState extends BaseState {
  BrandsState({
    super.status,
  });

  BrandsState.initial();

  @override
  BrandsState copyWith({
    BaseStatus? status,
  }) {
    return BrandsState(
      status: status ?? this.status,
    );
  }
}
