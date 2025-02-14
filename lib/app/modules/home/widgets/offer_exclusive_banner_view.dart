import 'package:core/assets/dimens.dart';
import 'package:core/widgets/banner_top_contents.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/slider/hero_banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/black_linear_gradient.dart';

class OfferExclusiveBannerView
    extends ObservableView<HomeViewModel, HomeState, List<HeroBannerItem>> {
  const OfferExclusiveBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroBannerSlider(
      sliderHeight: Dimens.offerBannerHeight,
      bannersList: [
        Stack(
          children: [
            NetworkImageView(
              imageUrl:
                  "https://d12lv4dk0s9jk3.cloudfront.net/special_offer_17392826233823931.jpg",
              fit: BoxFit.cover,
            ),
            BlackLinearGradient(),
            BannerTopContents(
              title: "title",
              subTitle: "subTitle",
              actionTitle: "actionTitle",
              actionPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
