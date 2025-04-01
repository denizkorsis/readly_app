import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/core/constants/enums/font_enum.dart';

import 'colors.dart';
import 'custom_theme.dart';

final class DarkTheme implements CustomTheme {
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
        snackBarTheme: snackBarTheme,
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
  BoxDecoration get containerDecoration => BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey, width: 1.w),
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 5,
        color: AppColors.black,
        foregroundColor: AppColors.white,
        surfaceTintColor: AppColors.blue,
        titleTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.white,
          fontSize: 20.spMin,
          fontWeight: CustomFontWeight.semiBold.weight,
        ),
      );

  @override
  DialogTheme get dialogTheme => DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        surfaceTintColor: AppColors.grey,
        titleTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.white,
          fontSize: 20.spMin,
          fontWeight: CustomFontWeight.semiBold.weight,
        ),
        contentTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.white,
          fontSize: 13.spMin,
        ),
      );

  @override
  CardTheme get cardTheme => CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.r),
        ),
        elevation: 1,
        margin: EdgeInsets.zero,
        color: AppColors.greyWeight.withOpacity(0.65),
        surfaceTintColor: AppColors.white,
      );

  @override
  BadgeThemeData get badgeTheme => BadgeThemeData(
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        textStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontSize: 15.spMin,
          fontWeight: CustomFontWeight.medium.weight,
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
        backgroundColor: WidgetStatePropertyAll(AppColors.grey),
        surfaceTintColor: WidgetStatePropertyAll(AppColors.grey),
        shadowColor: WidgetStatePropertyAll(AppColors.grey),
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
          foregroundColor: MaterialStatePropertyAll(AppColors.white),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.zero,
          ),
          textStyle: MaterialStatePropertyAll(
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
        backgroundColor: AppColors.appBar,
        selectedItemColor: AppColors.white,
        enableFeedback: true,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontFamily: FontFamily.poppins.family,
          fontSize: 12.spMin,
          fontWeight: CustomFontWeight.medium.weight,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontFamily: FontFamily.poppins.family,
          fontSize: 12.spMin,
          fontWeight: CustomFontWeight.medium.weight,
        ),
        elevation: 5,
      );

  @override
  BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
        backgroundColor: AppColors.shadow,
        modalBackgroundColor: AppColors.shadow,
        shadowColor: AppColors.shadow,
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
  Brightness get brightness => Brightness.dark;

  @override
  Color get disabledColor => AppColors.grey;

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(2),
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? AppColors.appBar
                : AppColors.appBar,
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
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
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.disabled)
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
              borderRadius: BorderRadius.circular(26.r),
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
        foregroundColor: AppColors.dark,
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
      borderSide: BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.circular(20.r),
      gapPadding: 0,
    );
    return InputDecorationTheme(
      fillColor: AppColors.grey,
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
        borderSide: BorderSide(color: AppColors.grey),
      ),
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: AppColors.lightGrey),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: BorderSide(color: AppColors.red),
      ),
    );
  }

  @override
  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: AppColors.white,
        indicatorColor: AppColors.white,
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
  Color get primaryColor => AppColors.black;

  @override
  Color get scaffoldBackgroundColor => AppColors.greyblack.withOpacity(0.7);

  @override
  Color get dialogBackgroundColor => AppColors.white;

  @override
  bool get useMaterial3 => true;

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.grey
              : AppColors.softGrey;
        }),
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.disabled)
                ? AppColors.grey
                : states.contains(MaterialState.selected)
                    ? AppColors.white
                    : null;
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.comfortable,
        shape: CircleBorder(
          side: BorderSide(
            color: AppColors.white,
            width: 1.5.w,
          ),
        ),
        side: BorderSide(
          color: AppColors.white,
          width: 1.5.w,
        ),
      );

  @override
  SnackBarThemeData get snackBarTheme => SnackBarThemeData(
        backgroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        showCloseIcon: true,
        closeIconColor: AppColors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 32.r),
        contentTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          fontWeight: CustomFontWeight.medium.weight,
          color: AppColors.white,
          fontSize: 14.spMin,
        ),
      );

  @override
  InteractiveInkFeatureFactory get splashFactory => InkRipple.splashFactory;

  @override
  TextStyle get forumTitle => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.lightGrey,
        fontSize: 16.sp,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get displayLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 64.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 48.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 32.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get headlineLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.orange,
        //Purple, not white, used on the premium dialog
        fontSize: 28.spMin,
        height: 1.5,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 24.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get bottomNavBarStyle => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.greyblack.withOpacity(0.7),
        fontSize: 12.spMin,
        fontWeight: CustomFontWeight.regular.weight,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 20.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 19.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 18.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 17.spMin,
        fontWeight: CustomFontWeight.semiBold.weight,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 16.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 15.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        color: AppColors.white,
        fontSize: 14.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontFamily: FontFamily.poppins.family,
        letterSpacing: 0,
        color: AppColors.white,
        fontSize: 13.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get labelMedium => TextStyle(
        fontFamily: FontFamily.poppins.family,
        letterSpacing: 0,
        color: AppColors.white,
        fontSize: 12.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontFamily: FontFamily.poppins.family,
        letterSpacing: 0,
        color: AppColors.white,
        fontSize: 10.spMin,
        fontWeight: CustomFontWeight.medium.weight,
      );

  @override
  ListTileThemeData get listTileTheme => ListTileThemeData(
        tileColor: AppColors.white,
        selectedTileColor: AppColors.dark,
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        titleTextStyle: TextStyle(
          fontFamily: FontFamily.poppins.family,
          color: AppColors.white,
          fontSize: 17.spMin,
          fontWeight: CustomFontWeight.semiBold.weight,
        ),
      );

  @override
  BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
        color: AppColors.greyblack.withOpacity(0.7),
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
