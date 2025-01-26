import 'package:flutter/material.dart';

import 'theme_color_extension.dart';

part 'color/dark_color_palette.dart';
part 'color/light_color_palette.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  static ThemeData _applyColorScheme(
    ThemeData theme,
    ThemeColorExtension colors,
  ) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.primaryContainer,
        onPrimaryContainer: colors.onPrimaryContainer,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        secondaryContainer: colors.secondaryContainer,
        onSecondaryContainer: colors.onSecondaryContainer,
        tertiary: colors.tertiary,
        onTertiary: colors.onTertiary,
        tertiaryContainer: colors.tertiaryContainer,
        onTertiaryContainer: colors.onTertiaryContainer,
        error: colors.error,
        onError: colors.onError,
        errorContainer: colors.errorContainer,
        onErrorContainer: colors.onErrorContainer,
        surface: colors.surface,
        onSurface: colors.onSurface,
        surfaceContainerHighest: colors.surfaceContainerHighest,
        onSurfaceVariant: colors.onSurfaceVariant,
        outline: colors.outline,
        outlineVariant: colors.outlineVariant,
        shadow: colors.shadow,
        scrim: colors.scrim,
        inverseSurface: colors.inverseSurface,
        onInverseSurface: colors.onInverseSurface,
        inversePrimary: colors.inversePrimary,
        surfaceTint: colors.surfaceTint,
      ),
    );
  }

  /// Light theme
  static final light = _applyColorScheme(
    ThemeData.light().copyWith(
      extensions: [
        _lightColorPalette,
      ],
    ),
    _lightColorPalette,
  );

  /// Dark theme
  static final dark = _applyColorScheme(
    ThemeData.dark().copyWith(
      extensions: [
        _darkColorPalette,
      ],
    ),
    _darkColorPalette,
  );
}
