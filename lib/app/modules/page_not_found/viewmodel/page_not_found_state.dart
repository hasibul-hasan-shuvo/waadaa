import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class PageNotFoundState extends BaseState {

  PageNotFoundState({
    super.status,
  });

  PageNotFoundState.initial();

  @override
  PageNotFoundState copyWith({
    BaseStatus? status,
  }) {
    return PageNotFoundState(
      status: status ?? this.status,
    );
  }
}
