import 'package:core/assets/dimens.dart';
import 'package:core/widgets/banner_top_contents.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/slider/hero_banner_slider.dart';
import 'package:domain/models/hero_banner_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/black_linear_gradient.dart';

class HeroBannersView
    extends ObservableView<HomeViewModel, HomeState, List<HeroBannerItem>> {
  const HeroBannersView({super.key});

  @override
  Widget body(BuildContext context, List<HeroBannerItem> state) {
    return HeroBannerSlider(
      sliderHeight: Dimens.heroBannerHeight,
      bannersList: List.generate(
        5,
        (index) {
          return Stack(
            children: [
              NetworkImageView(
                imageUrl: "https://i.imgur.com/DG5yU2k.png",
                fit: BoxFit.cover,
              ),
              BlackLinearGradient(),
              // BannerTopContents(
              //   title: state[index].title,
              //   subTitle: state[index].subTitle,
              //   actionTitle: state[index].actionTitle,
              //   actionPressed: () {},
              // ),
            ],
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
