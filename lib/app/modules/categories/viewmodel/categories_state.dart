import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';
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

  CategoriesState getAllCategories(List<CategoryUIModel> categoryListFromApi) {
    categoryListFromApi[0].isSelected = true;
    return copyWith(categoryList: categoryListFromApi);
  }

  CategoriesState updateCategoryTitle(String title) {
    return copyWith(categoryTitle: title);
  }

  CategoriesState updateSubCategoryList(
    List<CategoryUIModel> subCategoryList,
  ) {
    return copyWith(subCategoryList: subCategoryList);
  }

  CategoriesState updatecategoryList(CategoryUIModel categoryList) {
    return copyWith(categoryList: categoryList.subcategories);
  }

  CategoriesState updateSelectedCategory(CategoryUIModel category) {
    final updatedCategoryList = categoryList.map((e) {
      if (e.isSelected) {
        e.isSelected = false;
      }

      if (e.id == category.id) {
        e.isSelected = true;
      }
      return e;
    }).toList();

    return copyWith(categoryList: updatedCategoryList);
  }
}
