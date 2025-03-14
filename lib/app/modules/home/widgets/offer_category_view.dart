import 'package:core/assets/dimens.dart';
import 'package:core/base/observable_view.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/models/category_offer_ui_model.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/item_offer_category_widget.dart';

class OfferCategoryView extends ObservableView<HomeViewModel, HomeState,
    List<CategoryOfferUiModel>> {
  const OfferCategoryView({super.key});

  @override
  Widget body(BuildContext context, List<CategoryOfferUiModel> state) {
    return state.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localizations.offerCategoriesTitle,
                style: context.textTheme.titleLarge,
              ).paddingOnly(top: Dimens.padding10),
              SizedBox(height: Dimens.padding10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.length,
                gridDelegate: _gridDelegate,
                itemBuilder: (context, index) {
                  return ItemOfferCategoryWidget(offerItem: state[index]);
                },
              ),
              if (state.isNotEmpty)
                AppSecondaryButton(
                  title: context.localizations.viewAllText,
                  onPressed: () {
                    context.getViewModel<HomeViewModel>().onViewAllClicked();
                  },
                ).paddingSymmetric(vertical: Dimens.padding10),
            ],
          ).paddingSymmetric(horizontal: Dimens.padding15)
        : SizedBox.shrink();
  }

  SliverGridDelegate get _gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      );

  @override
  List<CategoryOfferUiModel> observeState(HomeState state) {
    return state.categoryOffers ?? [];
  }
}
