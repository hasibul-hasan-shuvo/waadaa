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

class OfferExclusiveBannerView
    extends ObservableView<HomeViewModel, HomeState, OfferBannerItem> {
  const OfferExclusiveBannerView({super.key});

  @override
  Widget body(BuildContext context, OfferBannerItem state) {
    return AppSlider(
      sliderHeight: Dimens.offerBannerHeight,
      indicatorsPosition: SliderIndicatorsPosition.insideTop,
      itemList: [
        Stack(
          children: [
            NetworkImageView(
              imageUrl: state.bgImageUrl,
              fit: BoxFit.cover,
            ),
            BlackLinearGradient(),
            BannerTopContents(
              title: state.title,
              subTitle: state.subTitle,
              actionTitle: state.actionTitle,
              actionPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  @override
  OfferBannerItem observeState(HomeState state) {
    return state.exclusiveBanner ??
        OfferBannerItem(
          id: "",
          title: "",
          subTitle: "",
          actionTitle: "",
          actionUrl: "",
          fgImageUrl: "",
          bgImageUrl: "",
          tagName: "",
        );
  }
}
