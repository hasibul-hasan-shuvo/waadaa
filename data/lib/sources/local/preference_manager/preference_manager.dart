import 'package:data/sources/local/preference_manager/preference_keys.dart';

abstract class PreferenceManager {
  Future<bool> getBool(PreferenceKeys key, {bool defaultValue = false});

  Future<double> getDouble(PreferenceKeys key, {double defaultValue = 0.0});

  Future<int> getInt(PreferenceKeys key, {int defaultValue = 0});

  Future<String> getString(PreferenceKeys key, {String defaultValue = ""});

  Future<void> saveBool(PreferenceKeys key, bool value);

  Future<void> saveDouble(PreferenceKeys key, double value);

  Future<void> saveInt(PreferenceKeys key, int value);

  Future<void> saveString(PreferenceKeys key, String value);

  Future<void> remove(PreferenceKeys key);

  Future<void> clear();

  Future<void> reloadCache();
}
