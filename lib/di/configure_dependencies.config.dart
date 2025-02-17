// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:waadaa/app/modules/account/viewmodel/account_view_model.dart'
    as _i890;
import 'package:waadaa/app/modules/brands/viewmodel/brands_view_model.dart'
    as _i694;
import 'package:waadaa/app/modules/categories/viewmodel/categories_view_model.dart'
    as _i1041;
import 'package:waadaa/app/modules/home/viewmodel/home_view_model.dart'
    as _i261;
import 'package:waadaa/app/modules/main/viewmodel/main_view_model.dart'
    as _i177;
import 'package:waadaa/app/modules/my_cart/viewmodel/my_cart_view_model.dart'
    as _i128;
import 'package:waadaa/app/modules/page_not_found/viewmodel/page_not_found_view_model.dart'
    as _i394;

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
  gh.factory<_i261.HomeViewModel>(() => _i261.HomeViewModel());
  gh.factory<_i128.MyCartViewModel>(() => _i128.MyCartViewModel());
  gh.factory<_i694.BrandsViewModel>(() => _i694.BrandsViewModel());
  gh.factory<_i890.AccountViewModel>(() => _i890.AccountViewModel());
  gh.factory<_i177.MainViewModel>(() => _i177.MainViewModel());
  gh.factory<_i1041.CategoriesViewModel>(() => _i1041.CategoriesViewModel());
  gh.factory<_i394.PageNotFoundViewModel>(() => _i394.PageNotFoundViewModel());
  return getIt;
}
