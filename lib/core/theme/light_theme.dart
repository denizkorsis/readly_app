import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/core/constants/enums/font_enum.dart';

import 'colors.dart';
import 'custom_theme.dart';

final class LightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        brightness: brightness,
        primaryColor: primaryColor,
        dialogBackgroundColor: dialogBackgroundColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: appBarTheme,
        disabledColor: disabledColor,
        splashFactory: splashFactory,
        tabBarTheme: tabBarTheme,
        badgeTheme: badgeTheme,
        listTileTheme: listTileTheme,
        bottomNavigationBarTheme: bottomNavigationBarTheme,
        bottomSheetTheme: bottomSheetTheme,
        bottomAppBarTheme: bottomAppBarTheme,
        dropdownMenuTheme: dropdownMenuTheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        elevatedButtonTheme: elevatedButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        textButtonTheme: textButtonThemeData,
        dialogTheme: dialogTheme,
        cardTheme: cardTheme,
        dividerTheme: dividerTheme,
        checkboxTheme: checkboxThemeData,
        primaryTextTheme: TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
        ),
        textTheme: TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
        ),
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 0,
        color: AppColors.white,
        foregroundColor: AppColors.textBlack,
        surfaceTintColor: AppColors.softGrey,
        titleTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.textBlack,
          fontSize: 20.spMin,
          fontWeight: CustomFontWeight.semiBold.weight,
        ),
      );

  @override
  DialogTheme get dialogTheme => DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        surfaceTintColor: AppColors.white,
        titleTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.textBlack,
          fontSize: 20.spMin,
          fontWeight: CustomFontWeight.regular.weight,
        ),
        contentTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.textBlack,
          fontSize: 16.spMin,
        ),
      );

  @override
  CardTheme get cardTheme => CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.r),
        ),
        elevation: 1,
        margin: EdgeInsets.zero,
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
      );

  @override
  BadgeThemeData get badgeTheme => BadgeThemeData(
        backgroundColor: AppColors.orange,
        textColor: AppColors.white,
        textStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 15.spMin,
          fontWeight: CustomFontWeight.medium.weight,
          color: AppColors.textBlack,
        ),
      );

  @override
  DropdownMenuThemeData get dropdownMenuTheme {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey),
      gapPadding: 0,
      borderRadius: BorderRadius.circular(16.r),
    );
    return DropdownMenuThemeData(
      textStyle: TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 14.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.grey,
        iconColor: AppColors.white,
        suffixIconColor: AppColors.white,
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        contentPadding:
            EdgeInsets.only(left: 12.w, right: 6.w, top: 10.h, bottom: 10.h),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.lightGrey,
          fontSize: 14.spMin,
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.white,
          fontSize: 14.spMin,
        ),
        border: border,
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: AppColors.red),
        ),
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.softGrey),
        surfaceTintColor: WidgetStatePropertyAll(AppColors.softGrey),
        shadowColor: WidgetStatePropertyAll(AppColors.softGrey),
        elevation: const WidgetStatePropertyAll(5),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColors.black),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.zero,
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontFamily: FontFamily.poppins.family,
              fontSize: 13.spMin,
              fontWeight: CustomFontWeight.semiBold.weight,
            ),
          ),
        ),
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.lightGrey,
        selectedItemColor: AppColors.black,
        enableFeedback: false,
        unselectedItemColor: AppColors.black,
        selectedLabelStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 12.spMin,
          fontWeight: CustomFontWeight.medium.weight,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 12.spMin,
          fontWeight: CustomFontWeight.medium.weight,
        ),
        elevation: 5,
      );

  @override
  BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
        backgroundColor: AppColors.white,
        modalBackgroundColor: AppColors.white,
        shadowColor: AppColors.white,
        dragHandleColor: AppColors.white,
        elevation: 0,
        modalElevation: 0,
        showDragHandle: false,
        //Drag handle is false, because used custom drag handle
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
      );

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get disabledColor => AppColors.grey;

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(2),
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? AppColors.lightGrey
                : AppColors.appBar,
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
              side: BorderSide.none,
            ),
          ),
          overlayColor: WidgetStatePropertyAll(AppColors.appBar),
          foregroundColor: WidgetStatePropertyAll(AppColors.white),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontFamily: FontFamily.poppins.family,
              fontSize: 18,
              fontWeight: CustomFontWeight.semiBold.weight,
            ),
          ),
        ),
      );

  @override
  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? AppColors.grey
                : AppColors.transparent,
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: AppColors.white,
              width: 2.w,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          overlayColor: WidgetStatePropertyAll(AppColors.grey),
          foregroundColor: WidgetStatePropertyAll(AppColors.white),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontFamily: FontFamily.poppins.family,
              fontSize: 18,
              fontWeight: CustomFontWeight.semiBold.weight,
            ),
          ),
        ),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      FloatingActionButtonThemeData(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.orange,
        elevation: 5,
        focusElevation: 5,
        hoverElevation: 5,
        splashColor: AppColors.white,
        focusColor: AppColors.white,
        hoverColor: AppColors.white,
        disabledElevation: 5,
        highlightElevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        extendedTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 18,
          fontWeight: CustomFontWeight.semiBold.weight,
        ),
      );

  @override
  InputDecorationTheme get inputDecorationTheme {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.softBlack),
      borderRadius: BorderRadius.circular(10.r),
      gapPadding: 0,
    );
    return InputDecorationTheme(
      fillColor: AppColors.softGrey,
      filled: true,
      isDense: true,
      errorStyle: TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.red,
        fontSize: 12.spMin,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.hint,
        fontSize: 14.spMin,
      ),
      border: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: AppColors.red),
      ),
      enabledBorder: border,
      disabledBorder: border.copyWith(
        borderSide: BorderSide(
          color: AppColors.orange,
        ),
      ),
      focusedBorder: border.copyWith(
        borderSide: BorderSide(
          color: AppColors.white,
          width: 1.5.w,
        ),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: BorderSide(color: AppColors.red),
      ),
    );
  }

  @override
  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: AppColors.white,
        indicatorColor: AppColors.orange,
        unselectedLabelColor: AppColors.white.withOpacity(0.5),
        unselectedLabelStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 13.spMin,
          fontWeight: CustomFontWeight.medium.weight,
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 13.spMin,
          fontWeight: CustomFontWeight.medium.weight,
        ),
      );

  @override
  Color get primaryColor => AppColors.white;

  @override
  Color get scaffoldBackgroundColor => AppColors.softGrey;

  @override
  Color get dialogBackgroundColor => AppColors.black;

  @override
  bool get useMaterial3 => true;

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        checkColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled)
              ? AppColors.orange
              : AppColors.orange;
        }),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.disabled)
                ? AppColors.orange
                : states.contains(WidgetState.selected)
                    ? AppColors.white
                    : null;
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.comfortable,
        shape: CircleBorder(
          side: BorderSide(
            color: AppColors.orange,
            width: 1.5.w,
          ),
        ),
        side: BorderSide(
          color: AppColors.orange,
          width: 1.5.w,
        ),
      );

  @override
  InteractiveInkFeatureFactory get splashFactory => InkRipple.splashFactory;

  @override
  TextStyle get forumTitle => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 16.sp,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get displayLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 64.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 48.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 32.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get bottomNavBarStyle => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.greyishBlack,
        fontSize: 12.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get headlineLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 28.spMin,
        height: 1.5,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 24.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 20.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 19.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 18.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 17.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 16.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 15.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.textBlack,
        fontSize: 14.spMin,
        fontWeight: CustomFontWeight.light.weight,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        letterSpacing: 0,
        color: AppColors.textBlack,
        fontSize: 13.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get labelMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        letterSpacing: 0,
        color: AppColors.textBlack,
        fontSize: 12.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        letterSpacing: 0,
        color: AppColors.textBlack.withOpacity(0.7),
        fontSize: 10.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  ListTileThemeData get listTileTheme => ListTileThemeData(
        tileColor: AppColors.greyWeight.withOpacity(0.45),
        selectedTileColor: AppColors.softGrey,
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        titleTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.textBlack,
          fontSize: 17.spMin,
          fontWeight: CustomFontWeight.semiBold.weight,
        ),
      );

  @override
  BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
        color: AppColors.softGrey,
        elevation: 5,
        shape: const CircularNotchedRectangle(),
      );

  @override
  DividerThemeData get dividerTheme => DividerThemeData(
        color: AppColors.white.withOpacity(0.5),
        space: 12.h,
        thickness: 0.2,
      );
}
