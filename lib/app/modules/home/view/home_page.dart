import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:core/widgets/primary_app_bar.dart';
import 'package:core/widgets/product_list_section.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_state.dart';
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart';
import 'package:waadaa/app/modules/home/widgets/hero_banners_view.dart';
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
          offerCategorySection(),
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

  Widget offerCategorySection() {
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
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return categoryItem();
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

  Widget categoryItem() {
    return InkWell(
      onTap: () {
        log("category");
      },
      child: Column(
        children: [
          Container(
            color: Color(0xFFF7F5F2),
            padding: EdgeInsets.all(4),
            child: CachedNetworkImage(
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/eae2/361c/c958aaaadc2d38f86dcb170a73cf843b?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SD6~f34pDUqSx7kvm1hGSQZmr89iPCdTr0sw8ERFO1dStVfFXIuoxdNv2N3Z2SU9MqQV8bhZ8WZkro2qTypXq0UhP3I7FfNXe7L84YdszILHNY63a7xMheiBKHqSDlDEQBcfAmop8XI2x-8JhJPtiT8ond3prA6Ql1AReH8MAUpE9-HjdzbviuS1i7H-kSzsKXvz7qScUxmmFR8vKRgJATuOJiZuDxXmUBkz4s7d7Q-T4jk~U8~vQDXL4dTi21Yjl7uPti2qfkQI9cfjUeyiybZXOd4DEQ2yRoOKLYaafX9Rsy9eLktlrgdVbdnAxjK~GRix8iXewByMdvuKla~Euw__",
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Beauty & Grooming",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget singleBanner() {
    return InkWell(
      onTap: () {},
      child: CachedNetworkImage(imageUrl: "https://i.imgur.com/FVvYyeT.png")
          .paddingOnly(top: 5, bottom: 10),
    );
  }
}
