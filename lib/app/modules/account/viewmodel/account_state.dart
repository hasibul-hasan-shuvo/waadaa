import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';

class AccountState extends BaseState {
  AccountState({
    super.status,
  });

  AccountState.initial();

  @override
  AccountState copyWith({
    BaseStatus? status,
  }) {
    return AccountState(
      status: status ?? this.status,
    );
  }
}
