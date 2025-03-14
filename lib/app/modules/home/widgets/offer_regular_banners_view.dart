import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/banner_top_contents.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/slider/app_slider.dart';
import 'package:core/widgets/slider/slider_indicators_position.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/models/offer_banner_ui_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:core/widgets/image_overlay.dart';

class OfferRegularBannersView
    extends ObservableView<HomeViewModel, HomeState, List<OfferBannerUiModel>> {
  const OfferRegularBannersView({super.key});

  @override
  Widget body(BuildContext context, List<OfferBannerUiModel> state) {
    return state.isNotEmpty
        ? AppSlider(
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
                    ImageOverlay(),
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
          )
        : SizedBox.shrink();
  }

  @override
  List<OfferBannerUiModel> observeState(HomeState state) {
    return state.regularBanners ?? [];
  }
}
