import 'package:core/assets/dimens.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_primary_button.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/home_counter_view.dart';
import 'package:waadaa/app/modules/home/widgets/home_message_view.dart';

class HomePage extends BasePage<HomeViewModel, HomeState> {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PrimaryAppBar(
      title: context.localizations.homeTitle,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        HomeMessageView(),
        HomeCounterView(),
        Center(
          child: AppPrimaryButton(
            title: "Increment",
            onPressed: () => context.getViewModel<HomeViewModel>().increment(),
          ),
        ),
        Center(
          child: AppSecondaryButton(
            title: "Update message",
            onPressed: () =>
                context.getViewModel<HomeViewModel>().updateMessage(),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: Dimens.paddingLarge);
  }
}
