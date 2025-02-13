import 'package:core/assets/dimens.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';

class ItemCategory
    extends ObservableView<CategoriesViewModel, CategoriesState, bool> {
  const ItemCategory({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget body(BuildContext context, bool state) {
    final viewModel = context.getViewModel<CategoriesViewModel>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: state ? Colors.black : Colors.grey.shade100,
            width: 2,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        viewModel.state.categoryList[index].name,
        style: TextStyle(
          color: state ? Colors.black : Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  bool observeState(CategoriesState state) {
    return state.categoryList[index].isSelected;
  }
}
