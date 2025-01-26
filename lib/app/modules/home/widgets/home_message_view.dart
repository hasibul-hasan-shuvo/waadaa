import 'package:core/widgets/app_text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';

class HomeMessageView extends ObservableView<HomeViewModel, HomeState, String> {
  const HomeMessageView({super.key});

  @override
  Widget body(BuildContext context, String state) {
    return AppTextView(state);
  }

  @override
  String observeState(HomeState state) {
    return state.message;
  }
}
