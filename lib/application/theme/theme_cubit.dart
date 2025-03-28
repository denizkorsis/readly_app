import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readly/core/theme/light_theme.dart';
import 'package:readly/core/theme/dark_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(LightTheme().themeData);

  void setLightTheme() => emit(LightTheme().themeData);
  void setDarkTheme() => emit(DarkTheme().themeData);
}
