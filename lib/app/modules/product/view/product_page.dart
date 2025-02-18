import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_state.dart';
import 'package:waadaa/app/modules/product/viewmodel/product_view_model.dart';

class ProductPage extends BasePage<ProductViewModel, ProductState> {
  final String id;

  const ProductPage({
    super.key,
    required this.id,
  });

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("This is product page"),
    );
  }
}
