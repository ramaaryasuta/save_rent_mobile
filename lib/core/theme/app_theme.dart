import 'package:flutter/material.dart';

import '../services/app_theme_service.dart';
import 'color_schemes.dart';
import 'text_theme.dart';

ThemeData appThemeData(AppThemeProvider appThemeP) {
  final appTheme = ThemeData(
    dialogTheme: DialogThemeData(
      surfaceTintColor: appThemeP.isDarkMode
          ? darkColorScheme.surface
          : lightColorScheme.surface,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      surfaceTintColor: appThemeP.isDarkMode
          ? darkColorScheme.surface
          : lightColorScheme.surface,
    ),
    dividerTheme: DividerThemeData(
      color: appThemeP.isDarkMode
          ? darkColorScheme.outline.withValues(alpha: 0.3)
          : lightColorScheme.outline.withValues(alpha: 0.3),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: appThemeP.isDarkMode ? Brightness.dark : Brightness.light,
    colorScheme: appThemeP.isDarkMode ? darkColorScheme : lightColorScheme,
    useMaterial3: true,
    textTheme: mTextTheme,
  );

  return appTheme;
}
