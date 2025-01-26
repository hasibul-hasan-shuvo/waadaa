import 'package:data/sources/local/preference_manager/preference_keys.dart';
import 'package:data/sources/local/preference_manager/preference_manager.dart';
import 'package:di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PreferenceManager)
class PreferenceManagerImpl implements PreferenceManager {
  final Future<SharedPreferencesWithCache> _preference =
      SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: cachingKeys.map((key) => key.toPreferenceFormat).toSet(),
    ),
  );

  @override
  Future<bool> getBool(PreferenceKeys key, {bool defaultValue = false}) {
    return _preference
        .then((preference) =>
            preference.getBool(key.toPreferenceFormat) ?? defaultValue)
        .catchError((error) => defaultValue);
  }

  @override
  Future<double> getDouble(PreferenceKeys key, {double defaultValue = 0.0}) {
    return _preference
        .then((preference) =>
            preference.getDouble(key.toPreferenceFormat) ?? defaultValue)
        .catchError((error) => defaultValue);
  }

  @override
  Future<int> getInt(PreferenceKeys key, {int defaultValue = 0}) {
    return _preference
        .then((preference) =>
            preference.getInt(key.toPreferenceFormat) ?? defaultValue)
        .catchError((error) => defaultValue);
  }

  @override
  Future<String> getString(PreferenceKeys key, {String defaultValue = ""}) {
    return _preference
        .then((preference) =>
            preference.getString(key.toPreferenceFormat) ?? defaultValue)
        .catchError((error) => defaultValue);
  }

  @override
  Future<void> saveBool(PreferenceKeys key, bool value) {
    return _preference.then(
      (preference) => preference.setBool(
        key.toPreferenceFormat,
        value,
      ),
    );
  }

  @override
  Future<void> saveDouble(PreferenceKeys key, double value) {
    return _preference.then(
      (preference) => preference.setDouble(
        key.toPreferenceFormat,
        value,
      ),
    );
  }

  @override
  Future<void> saveInt(PreferenceKeys key, int value) {
    return _preference.then(
      (preference) => preference.setInt(
        key.toPreferenceFormat,
        value,
      ),
    );
  }

  @override
  Future<void> saveString(PreferenceKeys key, String value) {
    return _preference.then(
      (preference) => preference.setString(
        key.toPreferenceFormat,
        value,
      ),
    );
  }

  @override
  Future<void> remove(PreferenceKeys key) {
    return _preference.then(
      (preference) => preference.remove(key.toPreferenceFormat),
    );
  }

  @override
  Future<void> clear() {
    return _preference.then(
      (preference) => preference.clear(),
    );
  }

  @override
  Future<void> reloadCache() {
    return _preference.then(
      (preference) => preference.reloadCache(),
    );
  }
}
