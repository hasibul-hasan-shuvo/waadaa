import 'package:core/config/environment_config.dart';
import 'package:core/config/environments.dart';

class BuildConfig {
  static final BuildConfig _instance = BuildConfig._internal();
  static bool _isInitialized = false;

  late final Environment _environment;
  late final EnvironmentConfig _config;

  BuildConfig._internal();

  static BuildConfig get instance {
    if (!_isInitialized) {
      throw StateError('BuildConfig has not been initialized. Call initialize() first.');
    }
    return _instance;
  }

  static void init({
    required Environment envType,
    required EnvironmentConfig envConfig,
  }) {
    if (_isInitialized) {
      throw StateError('BuildConfig has already been initialized.');
    }
    _instance._environment = envType;
    _instance._config = envConfig;
    _isInitialized = true;
  }

  Environment get environment => _environment;
  EnvironmentConfig get config => _config;
}
