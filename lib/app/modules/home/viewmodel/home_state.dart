import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class HomeState extends BaseState {
  String message = '';
  int counter = 0;

  HomeState({
    super.status,
    this.counter = 0,
    this.message = '',
  });

  HomeState.initial();

  @override
  HomeState copyWith({
    BaseStatus? status,
    String? message,
    int? counter,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      counter: counter ?? this.counter,
    );
  }

  HomeState increment() {
    return copyWith(counter: counter + 1);
  }

  HomeState updateMessage(String message) {
    return copyWith(message: "$message $counter");
  }
}
