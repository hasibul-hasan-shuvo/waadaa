import 'package:di/di.dart';
import 'package:domain/repositories/categories_repository.dart';
import 'package:waadaa/app/modules/categories/model/category_ui_model.dart';

@injectable
class CategoryListUseCase {
  final CategoriesRepository _categoryRepository;

  CategoryListUseCase(this._categoryRepository);

  Future<List<CategoryUIModel>> getCategories() {
    return _categoryRepository.getCategories().then(
        (value) => value.map((e) => CategoryUIModel.fromDomain(e)).toList());
  }
}
