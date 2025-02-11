import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:domain/models/category_offer_item.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/offer_category_item.dart';

class OfferCategoryView
    extends ObservableView<HomeViewModel, HomeState, List<CategoryOfferItem>> {
  const OfferCategoryView({super.key});

  @override
  Widget body(BuildContext context, List<CategoryOfferItem> state) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Offer on categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).paddingOnly(top: 10),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return OfferCategoryItem();
            },
          ),
          AppSecondaryButton(
            title: "VIEW ALL",
            onPressed: () {},
          ).paddingSymmetric(vertical: 10),
        ],
      ).paddingSymmetric(horizontal: 15),
    );
  }

  @override
  List<CategoryOfferItem> observeState(HomeState state) {
    return state.categoryOffers ?? [];
  }
}
