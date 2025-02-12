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

  void updateCategoryTitle(String title) {
    updateCategoryTitle(title);
  }

  @override
  Future<void> onViewReady() async {
    super.onViewReady();
    getCategories();
  }

  void getCategories() {
    callDataService(
      _categoryListUseCase.getCategories(),
      onSuccess: _handleCategoryListSucessResponse,
    );
  }

  void _handleCategoryListSucessResponse(List<Category> categoryList) {
    updateState(state.getAllCategories(
      categoryList.map((e) => CategoryUIModel.fromDomain(e)).toList(),
    ));
  }

  void updateSelectedCategory(CategoryUIModel category) {
    updateState(state.updateSelectedCategory(category));
  }
}
