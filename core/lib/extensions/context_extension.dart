import 'package:core/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeColorExtension get colors => theme.extension<ThemeColorExtension>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}
