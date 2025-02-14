import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/banner_top_contents.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:core/widgets/product_list_section.dart';
import 'package:core/widgets/slider/hero_banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/hero_banners_view.dart';
import 'package:waadaa/app/modules/home/widgets/offer_category_view.dart';
import 'package:waadaa/app/modules/home/widgets/shop_by_section.dart';
import 'package:waadaa/app/modules/home/widgets/welcome_reward_view.dart';

class HomePage extends BasePage<HomeViewModel, HomeState> {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PrimaryAppBar(
      title: context.localizations.homeTitle,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.black,
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
          singleBanner(),
          OfferCategoryView(),
          singleBanner(),
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

  Widget singleBanner() {
    return HeroBannerSlider(
      sliderHeight: 200,
      bannersList: [
        Stack(
          children: [
            NetworkImageView(
              imageUrl: "https://i.imgur.com/FVvYyeT.png",
              fit: BoxFit.cover,
            ),
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
