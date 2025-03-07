import 'package:core/base/base_page.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
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
    context.getViewModel<ProductViewModel>().setId(id);

    return Center(
      child: Text("This is product page"),
    );
  }
}
