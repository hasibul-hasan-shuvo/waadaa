import 'package:core/base/observable_view.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/home_reward_view.dart';

class HomeRewardWithShimmerView
    extends ObservableView<HomeViewModel, HomeState, bool> {
  const HomeRewardWithShimmerView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              padding: EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : HomeRewardView();
  }

  @override
  bool observeState(HomeState state) {
    return state.isRewardLoading;
  }
}
