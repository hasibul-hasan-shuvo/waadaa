import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/offer_exclusive_banner_view.dart';

class OfferExclusiveBannerWithShimmerView
    extends ObservableView<HomeViewModel, HomeState, bool> {
  const OfferExclusiveBannerWithShimmerView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
            child: Container(
              color: Colors.black,
              height: Dimens.offerBannerHeight,
            ),
          )
        : OfferExclusiveBannerView();
  }

  @override
  bool observeState(HomeState state) {
    return state.isOfferBannersLoading;
  }
}
