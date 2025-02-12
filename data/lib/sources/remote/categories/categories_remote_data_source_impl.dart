import 'package:data/models/category_response.dart';
import 'package:data/sources/remote/base/base_remote_data_source.dart';
import 'package:data/sources/remote/categories/categories_remote_data_source.dart';
import 'package:data/sources/remote/clients/end_points.dart';
import 'package:data/sources/remote/clients/models/NetworkResponse.dart';
import 'package:di/di.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl extends BaseRemoteDataSource
    implements CategoriesRemoteDataSource {
  CategoriesRemoteDataSourceImpl(super.client);

  @override
  Future<List<CategoryResponse>> getCategories() async {
    String endPoint = EndPoints.categoryList;

    final apiCall = client.get(endPoint);

    try {
      return callApiWithErrorParser(apiCall)
          .then((response) => _parseCategoryResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<CategoryResponse> _parseCategoryResponse(NetworkResponse response) {
    List<CategoryResponse> categoryList = [];

    if (response.data is List) {
      final List<dynamic> data = response.data as List<dynamic>;
      categoryList = data.map((e) => CategoryResponse.fromJson(e)).toList();
    }
    return categoryList;
  }
}
