import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class ProductState extends BaseState {

  ProductState({
    super.status,
  });

  ProductState.initial();

  @override
  ProductState copyWith({
    BaseStatus? status,
  }) {
    return ProductState(
      status: status ?? this.status,
    );
  }
}
