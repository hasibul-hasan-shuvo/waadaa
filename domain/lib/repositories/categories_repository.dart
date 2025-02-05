import 'package:domain/models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getCategories();
}
