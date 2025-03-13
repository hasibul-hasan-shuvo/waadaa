import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:core/widgets/slider/app_slider.dart';
import 'package:core/widgets/slider/slider_indicators_position.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/hero_banners_view.dart';

class HeroBannersWithShimmerView
    extends ObservableView<HomeViewModel, HomeState, bool> {
  const HeroBannersWithShimmerView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
            child: AppSlider(
                autoSlide: false,
                sliderHeight: Dimens.heroBannerHeight,
                indicatorsPosition: SliderIndicatorsPosition.outsideBottom,
                itemList: List.generate(
                  3,
                  (index) {
                    return Container(
                      color: Colors.black,
                    );
                  },
                )),
          )
        : HeroBannersView();
  }

  @override
  bool observeState(state) {
    return state.isHeroBannersLoading;
  }
}
