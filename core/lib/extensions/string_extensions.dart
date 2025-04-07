extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  String get toCapitalized =>
      isNullOrEmpty ? '' : '${this![0].toUpperCase()}${this!.substring(1)}';
}
