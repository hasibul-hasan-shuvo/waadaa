import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';

class HomeRewardView extends ObservableView<HomeViewModel, HomeState, String> {
  const HomeRewardView({super.key});

  @override
  Widget body(BuildContext context, String state) {
    return state.isNotEmpty
        ? Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimens.padding15,
              vertical: Dimens.padding14,
            ),
            padding: EdgeInsets.all(Dimens.padding14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Dimens.radiusMedium),
            ),
            child: Text(
              state,
              style: context.textTheme.labelMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          )
        : SizedBox.shrink();
  }

  @override
  String observeState(HomeState state) {
    return state.rewardText ?? "";
  }
}
