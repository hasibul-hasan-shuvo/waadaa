import 'package:core/assets/app_icons.dart';
import 'package:core/base/base_page.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/hero_banners_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/home_reward_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/latest_products_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/offer_category_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/offer_exclusive_banner_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/offer_regular_banners_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/recommended_products_with_shimmer_view.dart';
import 'package:waadaa/app/modules/home/widgets/shop_by_section.dart';

class HomePage extends BasePage<HomeViewModel, HomeState> {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PrimaryAppBar(
      title: context.localizations.homeTitle,
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
          HeroBannersWithShimmerView(),
          HomeRewardWithShimmerView(),
          ShopBySectionView(),
          LatestProductsWithShimmerView(),
          OfferExclusiveBannerWithShimmerView(),
          OfferCategoryWithShimmerView(),
          OfferRegularBannersWithShimmerView(),
          RecommendedProductsWithShimmerView(),
        ],
      ),
    );
  }
}
