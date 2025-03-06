import 'package:core/base/observable_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';

class HomeRewardView extends ObservableView<HomeViewModel, HomeState, String> {
  const HomeRewardView({super.key});

  @override
  Widget body(BuildContext context, String state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      padding: EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        state,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  String observeState(HomeState state) {
    return state.rewardText ?? "";
  }
}
