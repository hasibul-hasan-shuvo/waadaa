import 'package:core/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/my_cart/viewmodel/my_cart_state.dart';
import 'package:waadaa/app/modules/my_cart/viewmodel/my_cart_view_model.dart';

class MyCartPage extends BasePage<MyCartViewModel, MyCartState> {
  const MyCartPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("This is my_cart page"),
    );
  }
}
