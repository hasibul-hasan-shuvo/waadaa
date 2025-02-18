import 'package:core/config/build_config.dart';
import 'package:core/config/environment_config.dart';
import 'package:core/config/environments.dart';
import 'package:waadaa/app/main.dart';

void main() {
  BuildConfig.init(
    envType: Environment.test,
    envConfig: EnvironmentConfig(
      appName: const String.fromEnvironment('appName'),
      baseUrl: const String.fromEnvironment('baseUrl'),
    ),
  );
  appMain();
}
