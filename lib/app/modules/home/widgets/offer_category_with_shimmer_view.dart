import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/offer_category_view.dart';

class OfferCategoryWithShimmerView
    extends ObservableView<HomeViewModel, HomeState, bool> {
  const OfferCategoryWithShimmerView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Dimens.textShimmerWidth,
            height: Dimens.textShimmerHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(Dimens.radiusSmall),
            ),
          ).paddingOnly(top: Dimens.padding10),
          SizedBox(height: Dimens.padding10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            gridDelegate: _gridDelegate,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black,
              );
            },
          ),
          SizedBox(height: Dimens.padding15),
        ],
      ).paddingSymmetric(horizontal: Dimens.padding15),
    )
        : OfferCategoryView();
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      );

  @override
  bool observeState(HomeState state) {
    return state.isCategoryOffersLoading;
  }
}
