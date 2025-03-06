import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/app_secondary_button.dart';
import 'package:core/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/home/models/product_ui_model.dart';

class ProductListSection extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<ProductUiModel> products;
  final Function() viewAllPressed;

  const ProductListSection({
    super.key,
    required this.title,
    this.subTitle,
    required this.products,
    required this.viewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
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
          if (subTitle != null)
            Text(
              subTitle!,
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
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ProductBox(
                name: products[index].name,
                description: products[index].description,
                imageUrl: products[index].imageUrl,
                price: products[index].price,
                currency: products[index].currency,
              );
            },
          ),
          if (products.isNotEmpty)
            AppSecondaryButton(
              title: "VIEW ALL",
              onPressed: viewAllPressed,
            ).paddingSymmetric(vertical: 10),
        ],
      ).paddingSymmetric(horizontal: 15),
    );
  }
}
