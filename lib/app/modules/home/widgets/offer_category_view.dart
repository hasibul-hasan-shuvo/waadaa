import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/models/category_offer_ui_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/offer_category_item.dart';

class OfferCategoryView extends ObservableView<HomeViewModel, HomeState,
    List<CategoryOfferUiModel>> {
  const OfferCategoryView({super.key});

  @override
  Widget body(BuildContext context, List<CategoryOfferUiModel> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localizations.offerCategoriesTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).paddingOnly(top: 10),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return OfferCategoryItem(offerItem: state[index]);
          },
        ),
        if (state.isNotEmpty)
          AppSecondaryButton(
            title: context.localizations.viewAllText,
            onPressed: () {
              context.getViewModel<HomeViewModel>().onViewAllClicked();
            },
          ).paddingSymmetric(vertical: 10),
      ],
    ).paddingSymmetric(horizontal: 15);
  }

  @override
  List<CategoryOfferUiModel> observeState(HomeState state) {
    return state.categoryOffers ?? [];
  }
}
