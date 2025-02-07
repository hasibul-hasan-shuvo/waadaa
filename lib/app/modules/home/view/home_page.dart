import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:core/widgets/primary_app_bar.dart';
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
          productListSection(title: "Latest fashion arrivals"),
          singleBanner(),
          offerCategorySection(),
          singleBanner(),
          productListSection(title: "Recommended for you"),
        ],
      ),
    );
  }

  Widget productListSection({
    required String title,
  }) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).paddingOnly(top: 10),
          Text(
            "The Nike Dunk Low is an easy score for your wardrobe",
            style: TextStyle(
              color: Color(0xFF7A7A7A),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ).paddingOnly(top: 2, bottom: 10),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return productBox();
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

  Widget productBox() {
    return InkWell(
      onTap: () {
        log("product box");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFFF7F5F2),
            padding: EdgeInsets.all(20),
            child: CachedNetworkImage(
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EMjRlDWiDiyPGKVql35KLJTc47Dn8b9F28pM7CKF4mWeCv0y~pzzeFC50~dKlMoJExBNqhR~KM8OH~65oIIv45sH7g7AdHU1y8ye9Gd0xjSeAamjxoBwbtSI5t9l4pkU8I918uCBoBVYuwTrfWjGYc63AqRW5og9r4qto~UwcuBl3j~JjldQQUwEfgmwSdtQfpikv8NwXaE0A~KQ1DL1Dus62eWzWT58qS2x-aS3uVVPRfzZezgP6p-yoEXiH33angbh2tH9DVGby~~1vUdD4zKA4znDyItE9jblQuxAKKJvmbsYQ2Mzkx1ohSTXJnHrK-BPg-pSNsqY25B34dB6uw__",
            ),
          ),
          SizedBox(height: 12),
          Text(
            "NIKE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Dunks 01, maroon red",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "TK 12,000",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
