import 'package:data/mapper/categories_mapper.dart';
import 'package:data/sources/remote/categories/categories_remote_data_source.dart';
import 'package:di/configure_dependencies.dart';
import 'package:di/di.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/repositories/categories_repository.dart';

@LazySingleton(as: CategoriesRepository)
@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRemoteDataSource remoteDataSource() =>
      getIt<CategoriesRemoteDataSource>();

  @override
  Future<List<CategoryModel>> getCategories() async {
    return CategoriesMapper.mapCategories(
      await remoteDataSource().getCategoriesFromRemote(),
    );
  }
}
