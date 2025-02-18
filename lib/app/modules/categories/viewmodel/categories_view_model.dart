import 'package:di/di.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/usecases/category_list_use_case.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/categories/model/category_ui_model.dart';
import 'package:waadaa/app/modules/categories/viewmodel/categories_state.dart';

@injectable
class CategoriesViewModel extends BaseViewModel<CategoriesState> {
  CategoriesViewModel(this._categoryListUseCase)
      : super(CategoriesState.initial());

  final CategoryListUseCase _categoryListUseCase;

  @override
  Future<void> onViewReady() async {
    super.onViewReady();
    _getCategories();
  }

  void _getCategories() {
    callDataService(
      _categoryListUseCase.getCategories(),
      onSuccess: _handleCategoryListSuccessResponse,
    );
  }

  void _handleCategoryListSuccessResponse(List<Category> categoryList) {
    updateState(state.updateAllCategories(
      categoryList.map((e) => CategoryUIModel.fromCategoryDomain(e)).toList(),
    ));

    updateState(
      state.updateSubCategoryList(
          CategoryUIModel.fromCategoryDomain(categoryList[0]).subcategories),
    );
  }

  void selectedCategory(CategoryUIModel category) {
    final updatedCategoryList = state.categoryList.map((e) {
      if (e.isSelected) {
        e.isSelected = false;
      }

      if (e.id == category.id) {
        e.isSelected = true;
      }
      return e;
    }).toList();

    updateState(state.updateCategoryList(updatedCategoryList));

    /// update sub category list
    updateState(state.updateSubCategoryList(category.subcategories));
  }

  void updateNavigationTitle(String title) {
    updateState(state.updateNavigationTitle(title));
  }
}
