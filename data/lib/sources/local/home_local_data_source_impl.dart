import 'package:data/sources/local/home_local_data_source.dart';
import 'package:di/di.dart';

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {}
