import 'dart:developer';

import 'package:core/assets/app_icons.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:core/widgets/product_list_section.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/hero_banners_view.dart';
import 'package:waadaa/app/modules/home/widgets/offer_exclusive_banner_view.dart';
import 'package:waadaa/app/modules/home/widgets/offer_category_view.dart';
import 'package:waadaa/app/modules/home/widgets/shop_by_section.dart';
import 'package:waadaa/app/modules/home/widgets/welcome_reward_view.dart';

class HomePage extends BasePage<HomeViewModel, HomeState> {
  const HomePage({super.key});

  final isLoggedIn = false;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PrimaryAppBar(
      title: (isLoggedIn) ? "Hi Abed" : context.localizations.homeTitle,
      actions: [
        IconButton(
          icon: AssetImageView(
            fileName: AppIcons.searchIcon,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: AssetImageView(
            fileName: AppIcons.favouriteIcon,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: AssetImageView(
            fileName: AppIcons.notificationUnreadIcon,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeroBannersView(),
          HomeRewardView(),
          ShopBySection(),
          ProductListSection(
            title: "Latest fashion arrivals",
            subTitle: "The Nike Dunk Low is an easy score for your wardrobe",
            viewAllPressed: () {
              log("view all pressed...");
            },
          ),
          OfferExclusiveBannerView(1),
          OfferCategoryView(),
          OfferExclusiveBannerView(3),
          ProductListSection(
            title: "Recommended for you",
            viewAllPressed: () {
              log("view all pressed...");
            },
          ),
        ],
      ),
    );
  }
}
