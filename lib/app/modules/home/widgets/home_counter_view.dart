import 'package:core/base/observable_view.dart';
import 'package:core/widgets/app_text_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';

class HomeCounterView extends ObservableView<HomeViewModel, HomeState, int> {
  const HomeCounterView({
    super.key,
  });

  @override
  Widget body(BuildContext context, int state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextView(
            'You have pushed the button this many times:',
          ),
          AppTextView(
            '$state',
          ),
        ],
      ),
    );
  }

  @override
  int observeState(HomeState state) {
    return state.counter;
  }
}
