import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/brands/viewmodel/brands_state.dart';
import 'package:waadaa/app/modules/brands/viewmodel/brands_view_model.dart';

class BrandsPage extends BasePage<BrandsViewModel, BrandsState> {
  const BrandsPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("This is brands page"),
    );
  }
}
