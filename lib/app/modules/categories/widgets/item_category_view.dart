import 'package:core/assets/dimens.dart';
import 'package:core/services/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/observable_view.dart';
import 'package:waadaa/app/extensions/context_extension.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart';

class CategoryItem
    extends ObservableView<CategoriesViewModel, CategoriesState, bool> {
  const CategoryItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget body(BuildContext context, bool state) {
    final viewModel = context.getViewModel<CategoriesViewModel>();
    AppLogger.d(
        'CategoryItem build ${viewModel.state.categoryList[index].name}.}');
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: state ? Colors.grey : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(Dimens.paddingSmall),
        margin: const EdgeInsets.only(right: Dimens.marginSmall),
        child: Text(
          viewModel.state.categoryList[index].name,
        ),
      ),
    );
  }

  @override
  bool observeState(CategoriesState state) {
    return state.categoryList[index].isSelected;
  }
}
