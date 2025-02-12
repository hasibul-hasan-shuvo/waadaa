import 'package:di/di.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/repositories/categories_repository.dart';

@injectable
class CategoryListUseCase {
  final CategoriesRepository _categoryRepository;

  CategoryListUseCase(this._categoryRepository);

  Future<List<Category>> getCategories() {
    return _categoryRepository
        .getCategories()
        .then((value) => value.map((e) => e).toList());
  }
}
