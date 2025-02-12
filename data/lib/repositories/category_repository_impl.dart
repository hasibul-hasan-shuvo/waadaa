import 'package:data/mapper/categories_domain_mapper.dart';
import 'package:data/sources/remote/categories/categories_remote_data_source.dart';
import 'package:di/di.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/repositories/categories_repository.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._remoteDataSource);

  final CategoriesRemoteDataSource _remoteDataSource;

  @override
  Future<List<Category>> getCategories() {
    return _remoteDataSource
        .getCategories()
        .then((data) => CategoriesDomainMapper().map(data));
  }
}
