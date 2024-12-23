import 'package:flutter/material.dart';

import 'app_style.dart';

class AppTheme {
  static const textSizeXs = 10.0;
  static const textSizeSm = 12.0;
  static const textSize2Sm = 13.0;
  static const textSizeBase = 14.0;
  static const textSizeLg = 16.0;
  static const textSizeXl = 18.0;
  static const textSize2Xl = 20.0;
  static const textSize3Xl = 22.0;
  static const textSize4Xl = 24.0;
  static const textSize5Xl = 26.0;
  static const textSize6Xl = 28.0;
  static const textSize7Xl = 30.0;

  var horizontalPadding = 15.0;

  static final ThemeData themeLight = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppStyle.purple,
      scaffoldBackgroundColor: AppStyle.white,
      appBarTheme: const AppBarTheme(
          elevation: 4,
          backgroundColor: AppStyle.purple,
          foregroundColor: Colors.white),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppStyle.purpleDark),
        bodyLarge: TextStyle(color: AppStyle.purpleDark),
        bodySmall: TextStyle(color: AppStyle.purpleDark),
      ));

  static final ThemeData themeDark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppStyle.purpleLight2,
      scaffoldBackgroundColor: AppStyle.purpleDark,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppStyle.purpleDark,
          foregroundColor: Colors.white),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppStyle.white),
        bodyLarge: TextStyle(color: AppStyle.white),
        bodySmall: TextStyle(color: AppStyle.white),
      ));
}
