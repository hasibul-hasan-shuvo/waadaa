import 'dart:developer';

import 'package:core/widgets/hero_banner_slider.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/sliding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';

class HeroBannersView extends ObservableView<HomeViewModel, HomeState, int> {
  const HeroBannersView({super.key});

  @override
  Widget body(BuildContext context, int state) {
    return Column(
      children: [
        HeroBannerSlider(
          items: List.generate(5, (index) {
            return NetworkImageView(
              imageUrl: 'https://i.imgur.com/DG5yU2k.png',
              fit: BoxFit.cover,
            );
          }),
          onPageChanged: (index) {
            log("slider index: $index");
            context.getViewModel<HomeViewModel>().updateHeroBannerIndex(index);
          },
        ),
        SlidingIndicator(
          activeIndex: state,
          count: 5,
        ),
      ],
    );
  }

  @override
  int observeState(state) {
    return state.heroBannerIndex;
  }
}
