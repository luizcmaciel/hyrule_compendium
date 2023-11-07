import 'package:flutter/material.dart';

sealed class ThemeConfig {
  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: ThemeColors.seedColor,
    brightness: Brightness.light,
    fontFamily: ThemeFonts.fontFamily,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}

sealed class ThemeColors {
  static Color seedColor = Colors.blue;
}

sealed class ThemeFonts {
  static String fontFamily = 'Philosopher';
}
