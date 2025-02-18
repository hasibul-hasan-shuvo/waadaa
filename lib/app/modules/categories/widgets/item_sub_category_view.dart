import 'package:core/assets/dimens.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/modules/categories/model/category_ui_model.dart';

class ItemSubCategoryView extends StatelessWidget {
  const ItemSubCategoryView({
    super.key,
    required this.state,
  });

  final CategoryUIModel state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
      height: Dimens.heightTabBar,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            state.name,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade700,
            size: Dimens.iconSmall,
          ),
        ],
      ),
    );
  }
}
