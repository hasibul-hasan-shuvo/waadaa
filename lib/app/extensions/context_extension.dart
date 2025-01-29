import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waadaa/app/base/base_view_model.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations =>
      AppLocalizations.of(this) ??
      (throw Exception('Localizations not found.'));

  VM getViewModel<VM extends BaseViewModel>() => read<VM>();
}
