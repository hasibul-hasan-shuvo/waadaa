import 'package:core/assets/dimens.dart';
import 'package:core/widgets/slider/app_slider.dart';
import 'package:core/widgets/slider/slider_indicators_position.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/hero_banner_item.dart';

class HeroBannersView
    extends ObservableView<HomeViewModel, HomeState, List<HeroBannerItem>> {
  const HeroBannersView({super.key});

  @override
  Widget body(BuildContext context, List<HeroBannerItem> state) {
    return AppSlider(
      sliderHeight: Dimens.heroBannerHeight,
      indicatorsPosition: SliderIndicatorsPosition.outsideBottom,
      itemList: List.generate(
        state.length,
        (index) {
          return HeroBannerWidget(
            imageUrl: state[index].imageUrl,
            title: state[index].title,
            subTitle: state[index].subTitle,
            actionTitle: state[index].actionTitle,
          );
        },
      ),
    );
  }

  @override
  List<HeroBannerItem> observeState(state) {
    return state.heroBanners ?? [];
  }
}
