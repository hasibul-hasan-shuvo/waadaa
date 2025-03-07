import 'package:core/base/base_status.dart';

abstract class BaseState {
  final BaseStatus? status;

  const BaseState({this.status});

  BaseState copyWith({BaseStatus? status});
}

class InitialState extends BaseState {
  const InitialState({super.status});
  @override
  BaseState copyWith({BaseStatus? status}) {
    return InitialState(status: status ?? this.status);
  }
}
