// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/repositories/home_repository_impl.dart' as _i387;
import 'package:data/sources/local/home_local_data_source.dart' as _i395;
import 'package:data/sources/local/home_local_data_source_impl.dart' as _i471;
import 'package:data/sources/local/preference_manager/preference_manager.dart'
    as _i960;
import 'package:data/sources/local/preference_manager/preference_manager_impl.dart'
    as _i941;
import 'package:data/sources/remote/clients/dio_client.dart' as _i317;
import 'package:data/sources/remote/clients/network_client.dart' as _i903;
import 'package:data/sources/remote/home_remote_data_source.dart' as _i397;
import 'package:data/sources/remote/home_remote_data_source_impl.dart' as _i724;
import 'package:domain/repositories/home_repository.dart' as _i718;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i903.NetworkClient>(() => _i317.DioClient());
  gh.lazySingleton<_i395.HomeLocalDataSource>(
      () => _i471.HomeLocalDataSourceImpl());
  gh.lazySingleton<_i718.HomeRepository>(() => _i387.HomeRepositoryImpl());
  gh.lazySingleton<_i397.HomeRemoteDataSource>(
      () => _i724.HomeRemoteDataSourceImpl(gh<_i903.NetworkClient>()));
  gh.lazySingleton<_i960.PreferenceManager>(
      () => _i941.PreferenceManagerImpl());
  return getIt;
}
