import 'package:core/services/logger_service.dart';
import 'package:domain/models/category_model.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class CategoriesState extends BaseState {
  String categoryTitle = "Categories";
  List<String> subCategoryTitlelist = [];
  List<CategoryModel> categoryModels = [];

  CategoriesState({
    super.status,
    required this.categoryTitle,
    required this.subCategoryTitlelist,
    required this.categoryModels,
  });

  CategoriesState.initial();

  // CategoriesState.loading(String categoryTitle);

  // CategoriesState.success(
  //   String categoryTitle,
  //   List<String> subCategoryTitlelist,
  //   List<CategoryModel> categoryModels,
  // );

  // CategoriesState.error(
  //   String categoryTitle,
  //   List<String> subCategoryTitlelist,
  //   List<CategoryModel> categoryModels,
  //   String message,
  // );

  @override
  CategoriesState copyWith({
    String? categoryTitle,
    List<String>? subCategoryTitlelist,
    List<CategoryModel>? categoryModels,
    BaseStatus? status,
  }) {
    return CategoriesState(
      categoryTitle: categoryTitle ?? this.categoryTitle,
      subCategoryTitlelist: subCategoryTitlelist ?? this.subCategoryTitlelist,
      categoryModels: categoryModels ?? this.categoryModels,
      status: status ?? this.status,
    );
  }

  CategoriesState getAllCategories(List<CategoryModel> categoryModelsFromApi) {
    AppLogger.i("categoryModelsFromApi: ${categoryModelsFromApi.length}");

    return copyWith(
      categoryModels: categoryModelsFromApi,
    );
  }

  CategoriesState updateCategoryTitle(String title) {
    return copyWith(categoryTitle: title);
  }

  CategoriesState updateSubCategoryTitleList(
      List<String> subCategoryTitlelist) {
    return copyWith(subCategoryTitlelist: subCategoryTitlelist);
  }

  CategoriesState updateCategoryModels(CategoryModel categoryModels) {
    return copyWith(categoryModels: categoryModels.subcategories);
  }
}
