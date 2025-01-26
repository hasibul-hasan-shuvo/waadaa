import 'package:data/sources/remote/base/base_remote_data_source.dart';
import 'package:data/sources/remote/home_remote_data_source.dart';
import 'package:di/di.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends BaseRemoteDataSource
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(super.client);
}
