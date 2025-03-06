import 'package:core/base/base_view_model.dart';
import 'package:core/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExtension on BuildContext {
  ThemeColorExtension get colors => theme.extension<ThemeColorExtension>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);

  VM getViewModel<VM extends BaseViewModel>() => read<VM>();
}
