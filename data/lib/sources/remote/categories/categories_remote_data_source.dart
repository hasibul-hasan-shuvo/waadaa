import 'package:data/models/category_response.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryResponse>> getCategories();
}
