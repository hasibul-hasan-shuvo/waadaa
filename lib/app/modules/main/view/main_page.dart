import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_state.dart';
import 'package:waadaa/app/modules/main/viewmodel/main_view_model.dart';
import 'package:waadaa/app/modules/main/widgets/main_bottom_nav_selected_item_page_view.dart';
import 'package:waadaa/app/modules/main/widgets/main_bottom_navbar_view.dart';

class MainPage extends BasePage<MainViewModel, MainState> {
  const MainPage({super.key});

  @override
  Widget body(BuildContext context) {
    return const MainBottomNavSelectedItemPageView();
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return const MainBottomNavbarView();
  }
}
