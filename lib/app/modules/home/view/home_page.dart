import 'package:carousel_slider/carousel_slider.dart';
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
  HomePage({super.key});

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
          CarouselSlider(
            options: CarouselOptions(height: 215.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    'assets/images/banner_home.png', // Path to your image
                    height: 200,
                    // width: double.infinity,
                    fit: BoxFit.fill,
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          rewardSection(),
          shopBySection(),
          productListSection(),
          // HomeMessageView(),
          // HomeCounterView(),
          // Center(
          //   child: AppPrimaryButton(
          //     title: "Increment",
          //     onPressed: () => viewModel.increment(),
          //   ),
          // ),
          // Center(
          //   child: AppSecondaryButton(
          //     title: "Update message",
          //     onPressed: () => viewModel.updateMessage(),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget rewardSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      padding: EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Welcome Reward: \$50 off first order",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget shopBySection() {
    return Container(
      height: 140,
      color: Color(0xFFFAF8F1),
      padding: const EdgeInsets.fromLTRB(15, 12, 0, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shop by",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ).paddingOnly(bottom: 10),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return categoryItem(
                  name: "Brands",
                  imageUrl: (index % 2 == 0)
                      ? "https://i.imgur.com/ZlueaNs.png"
                      : "https://s3-alpha-sig.figma.com/img/d6d5/9145/bd196583c6718411d5fcdd7b52bf7d0b?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kQiqX7WzdQDAy~q9xcIZh3UmVO0rp7U0Hjx5jm7PZl9pq5nYzrHLQ0uqc4GecTNtcH0mD3ORAcUI4aVznZjmt8sHUwlBZNqNJweH4Tz2mNXLRv878aOwr8qF2gz8Q884ArcFWKxQc-1byptmMtbLpSy3O46D4BUui~yOIgfIfvEMfGjsYZxTQzK9GMF10yi0VFEvxFmpFc~OV4agbfQri~VpI4y536NBk5uaSZOGy~XRIxgi5-f7WHfLIgqAkgx0Na4EQmomCECbhlPimHViiK5qIDr4ZlRofNGYzZ2LqcBD7Vc5CPfGb81fRAvJyM-fVPT99YS8fU-uWHbsC0k8cw__",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryItem({
    required String name,
    required String imageUrl,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFDEDEDE), // Border color
            width: 0.5, // Border width
          ),
          borderRadius: BorderRadius.circular(2.0),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ).paddingOnly(left: 8, top: 10, right: 5),
            Image.network(
              imageUrl, // Path to your image
              height: 200, // Optional: Adjust height
              fit: BoxFit.fill,
            ).paddingOnly(top: 7),
          ],
        ),
      ),
    );
  }

  Widget productListSection() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest fashion arrivals",
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
            itemCount: 6,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Color(0xFFF7F5F2),
          padding: EdgeInsets.all(20),
          child: Image.network(
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
    );
  }
}
