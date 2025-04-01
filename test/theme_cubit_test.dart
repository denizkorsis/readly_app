import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:readly/application/theme/theme_cubit.dart';

class TestThemeCubit extends ThemeCubit {
  TestThemeCubit() : super(initialTheme: ThemeData.light());

  @override
  void setLightTheme() => emit(ThemeData.light());

  @override
  void setDarkTheme() => emit(ThemeData.dark());
}
//Benim oluşturduğum ligt theme ve dark theme de .sp yapıları olduğu için ben de ThemeData.light() ve ThemeData.dark() kullandım.

void main() {
  test('ThemeCubit sets correct themes', () {
    final cubit = TestThemeCubit();

    cubit.setDarkTheme();
    expect(cubit.state.brightness, Brightness.dark);

    cubit.setLightTheme();
    expect(cubit.state.brightness, Brightness.light);
  });
}
