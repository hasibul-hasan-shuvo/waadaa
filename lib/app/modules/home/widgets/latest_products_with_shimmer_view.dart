import 'package:core/base/observable_view.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/shimmer_effect_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/latest_products_view.dart';

class LatestProductsWithShimmerView
    extends ObservableView<HomeViewModel, HomeState, bool> {
  const LatestProductsWithShimmerView({super.key});

  @override
  Widget body(BuildContext context, bool state) {
    return state
        ? ShimmerEffectView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ).paddingOnly(top: 10),
                SizedBox(height: 10),
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
              ],
            ).paddingSymmetric(horizontal: 15),
          )
        : LatestProductsView();
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      );

  @override
  bool observeState(HomeState state) {
    return state.isLatestProductsLoading;
  }
}
