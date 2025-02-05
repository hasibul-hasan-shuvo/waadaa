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
      client.get("https://api.dev.waadaa.app/product/api/menues/"),
    );

    // Ensure that response.data is a List and cast each element properly.
    final List<dynamic> data = response.data as List<dynamic>;

    final categories = data
        .map((e) => CategoryResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return categories;
  }
}
