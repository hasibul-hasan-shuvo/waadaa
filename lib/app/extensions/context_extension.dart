import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations =>
      AppLocalizations.of(this) ??
      (throw Exception('Localizations not found.'));
}
