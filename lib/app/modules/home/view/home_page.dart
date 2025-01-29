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
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
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
                    height: 200, // Optional: Adjust height
                    fit: BoxFit.fill,
                  ).paddingSymmetric(horizontal: 4);
                },
              );
            }).toList(),
          ),

          SizedBox(
            height: 30,
          ),

          shopBySection(),
          shopBySection(),
          shopBySection(),
          shopBySection(),
          shopBySection(),
          shopBySection(),

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

  Widget shopBySection() {
    return Container(
      height: 130,
      color: Color(0xFFFAF8F1),
      padding: const EdgeInsets.fromLTRB(10, 12, 0, 12),
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
          ).paddingOnly(left: 5),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 2.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return categoryItem(
                  name: "Brands",
                  imageUrl: (index % 2 == 1)
                      ? "https://i.imgur.com/vuyWPOH.png"
                      : "https://i.imgur.com/ZlueaNs.png",
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
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ).paddingOnly(left: 8, top: 10),
            Image.network(
              imageUrl, // Path to your image
              height: 200, // Optional: Adjust height
              fit: BoxFit.fill,
            ).paddingOnly(top: 10),
          ],
        ),
      ),
    );
  }

  Widget productListSection() {
    return Container(
      height: 200,
      // color: Color(0xFFFAF8F1),
      padding: const EdgeInsets.fromLTRB(10, 12, 0, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest fashion arrivals",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ).paddingOnly(left: 5),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 2.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return categoryItem(
                  name: "Brands",
                  imageUrl: (index % 2 == 1)
                      ? "https://i.imgur.com/vuyWPOH.png"
                      : "https://i.imgur.com/ZlueaNs.png",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
