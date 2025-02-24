import 'package:core/assets/dimens.dart';
import 'package:core/widgets/banner_top_contents.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/slider/app_slider.dart';
import 'package:core/widgets/slider/slider_indicators_position.dart';
import 'package:domain/models/offer_banner_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/black_linear_gradient.dart';

class OfferRegularBannersView
    extends ObservableView<HomeViewModel, HomeState, List<OfferBannerItem>> {
  const OfferRegularBannersView({super.key});

  @override
  Widget body(BuildContext context, List<OfferBannerItem> state) {
    return AppSlider(
      sliderHeight: Dimens.offerBannerHeight,
      indicatorsPosition: SliderIndicatorsPosition.outsideBottom,
      itemList: List.generate(
        state.length,
            (index) {
          return Stack(
            children: [
              NetworkImageView(
                imageUrl: state[index].bgImageUrl,
                fit: BoxFit.cover,
              ),
              BlackLinearGradient(),
              BannerTopContents(
                title: state[index].title,
                subTitle: state[index].subTitle,
                actionTitle: state[index].actionTitle,
                actionPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  List<OfferBannerItem> observeState(HomeState state) {
    return state.regularBanners ?? [];
  }
}
