import 'package:di/configure_dependencies.dart';
import 'package:di/di.dart';

import 'configure_dependencies.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies() async {
  $initGetIt(getIt);
}
