import 'package:flutter/material.dart';

abstract class CustomTheme {
  ThemeData get themeData;

  Brightness get brightness;

  Color get primaryColor;

  Color get dialogBackgroundColor;

  CardTheme get cardTheme;

  bool get useMaterial3;

  ListTileThemeData get listTileTheme;

  DialogTheme get dialogTheme;

  DropdownMenuThemeData get dropdownMenuTheme;

  BadgeThemeData get badgeTheme;

  Color get scaffoldBackgroundColor;

  AppBarTheme get appBarTheme;

  Color get disabledColor;

  TabBarTheme get tabBarTheme;

  InteractiveInkFeatureFactory get splashFactory;

  BottomNavigationBarThemeData get bottomNavigationBarTheme;

  BottomSheetThemeData get bottomSheetTheme;

  BottomAppBarTheme get bottomAppBarTheme;

  FloatingActionButtonThemeData get floatingActionButtonThemeData;

  ElevatedButtonThemeData get elevatedButtonThemeData;

  OutlinedButtonThemeData get outlinedButtonThemeData;

  InputDecorationTheme get inputDecorationTheme;

  TextButtonThemeData get textButtonThemeData;

  CheckboxThemeData get checkboxThemeData;

  DividerThemeData get dividerTheme;

  SnackBarThemeData get snackBarTheme;

  TextStyle get bottomNavBarStyle;

  TextStyle get displayLarge;

  TextStyle get displayMedium;

  TextStyle get displaySmall;

  TextStyle get headlineLarge;

  TextStyle get headlineMedium;

  TextStyle get headlineSmall;

  TextStyle get titleLarge;

  TextStyle get titleMedium;

  TextStyle get titleSmall;

  TextStyle get bodyLarge;

  TextStyle get bodyMedium;

  TextStyle get bodySmall;

  TextStyle get labelLarge;

  TextStyle get labelMedium;

  TextStyle get labelSmall;

  TextStyle get forumTitle;
}
