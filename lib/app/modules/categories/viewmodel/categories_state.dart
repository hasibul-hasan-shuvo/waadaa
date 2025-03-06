import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';
import 'package:waadaa/app/modules/categories/model/category_ui_model.dart';

class CategoriesState extends BaseState {
  String categoryTitle = "Categories";
  List<CategoryUIModel> subCategoryList = [];
  List<CategoryUIModel> categoryList = [];

  CategoriesState({
    super.status,
    required this.categoryTitle,
    required this.subCategoryList,
    required this.categoryList,
  });

  CategoriesState.initial();

  @override
  CategoriesState copyWith({
    String? categoryTitle,
    List<CategoryUIModel>? subCategoryList,
    List<CategoryUIModel>? categoryList,
    BaseStatus? status,
  }) {
    return CategoriesState(
      categoryTitle: categoryTitle ?? this.categoryTitle,
      subCategoryList: subCategoryList ?? this.subCategoryList,
      categoryList: categoryList ?? this.categoryList,
      status: status ?? this.status,
    );
  }

  CategoriesState updateAllCategories(
      List<CategoryUIModel> categoryListFromApi) {
    categoryListFromApi[0].isSelected = true;
    return copyWith(categoryList: categoryListFromApi);
  }

  CategoriesState updateNavigationTitle(String title) {
    return copyWith(categoryTitle: title);
  }

  CategoriesState updateSubCategoryList(
    List<CategoryUIModel> subCategoryList,
  ) {
    return copyWith(subCategoryList: subCategoryList);
  }

  CategoriesState updateCategoryList(
      List<CategoryUIModel> updatedCategoryList) {
    return copyWith(categoryList: updatedCategoryList);
  }
}
