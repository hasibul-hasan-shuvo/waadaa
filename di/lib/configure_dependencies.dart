import 'package:data/di/configure_dependencies.dart' as data;
import 'package:di/configure_dependencies.config.dart';
import 'package:domain/di/configure_dependencies.dart' as domain;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:waadaa/di/configure_dependencies.dart' as presentation;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await data.configureDependencies();
  await domain.configureDependencies();
  await presentation.configureDependencies();
  $initGetIt(getIt);
}
