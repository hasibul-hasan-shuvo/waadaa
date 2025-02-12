import 'package:data/models/category_response.dart';
import 'package:data/sources/remote/base/base_remote_data_source.dart';
import 'package:data/sources/remote/categories/categories_remote_data_source.dart';
import 'package:di/di.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl extends BaseRemoteDataSource
    implements CategoriesRemoteDataSource {
  CategoriesRemoteDataSourceImpl(super.client);

  @override
  Future<List<CategoryResponseModel>> getCategoriesFromRemote() async {
    final response = await callApiWithErrorParser(
      client.get("product/api/menues/"),
    );

    List<CategoryResponseModel> categories = [];

    // Ensure that response.data is a List and cast each element properly.
    if (response.data is List) {
      final List<dynamic> data = response.data;

      categories = data
          .map((e) => CategoryResponseModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return categories;
  }
}
