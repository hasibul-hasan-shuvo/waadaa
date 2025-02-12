// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/repositories/home_repository.dart' as _i718;
import 'package:domain/usecases/category_offers_use_case.dart' as _i199;
import 'package:domain/usecases/hero_banners_use_case.dart' as _i224;
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
  gh.lazySingleton<_i224.HeroBannersUseCase>(
      () => _i224.HeroBannersUseCase(gh<_i718.HomeRepository>()));
  gh.lazySingleton<_i199.CategoryOffersUseCase>(
      () => _i199.CategoryOffersUseCase(gh<_i718.HomeRepository>()));
  return getIt;
}
