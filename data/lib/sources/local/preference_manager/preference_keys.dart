enum PreferenceKeys {
  token,
}

extension PreferenceKeysExtension on PreferenceKeys {
  String get toPreferenceFormat {
    final RegExp regex = RegExp(r'(?<!^)([A-Z])');
    return name.replaceAllMapped(
      regex,
      (Match match) => '_${match.group(1)!.toLowerCase()}',
    );
  }
}

Set<PreferenceKeys> cachingKeys = <PreferenceKeys>{
  PreferenceKeys.token,
};
