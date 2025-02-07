import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class HomeState extends BaseState {
  String message = '';
  int counter = 0;
  int heroBannerIndex = 0;

  HomeState({
    super.status,
    this.counter = 0,
    this.message = '',
    this.heroBannerIndex = 0,
  });

  HomeState.initial();

  @override
  HomeState copyWith({
    BaseStatus? status,
    String? message,
    int? counter,
    int? heroBannerIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      counter: counter ?? this.counter,
      heroBannerIndex: heroBannerIndex ?? this.heroBannerIndex,
    );
  }

  HomeState increment() {
    return copyWith(counter: counter + 1);
  }

  HomeState updateHeroBannerIndex(int index) {
    return copyWith(heroBannerIndex: index);
  }

  HomeState updateMessage(String message) {
    return copyWith(message: "$message $counter");
  }
}
