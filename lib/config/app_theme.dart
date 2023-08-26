import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/data/local/my_shared_pref.dart';

class MyAppTheme {
  static ThemeData? lightThemeData = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: Colors.white,
    // this was accentColor
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.mainDarkColor(1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 2, foregroundColor: Colors.white),
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondColor(1),
        fontFamily: 'Comfortaa',
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.secondColor(1),
        fontFamily: 'Comfortaa',
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainColor(1),
        fontFamily: 'Comfortaa',
      ),
      //__________________________
      labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.mainColor(1)),
      labelMedium: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainDarkColor(0.5),
      ),
      labelSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.secondColor(1),),
      //__________________________
      displayLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.mainColor(1)),
      displayMedium: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainDarkColor(1),
      ),
      displaySmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: Colors.red,
      ),

      //__________________________
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainDarkColor(1),
      ),

      //__________________________
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Comfortaa',
        color: AppColors.fourthColor(1),
      ),
      bodySmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainDarkColor(1),
      ),
    ),
  );

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();
    // *) store the new theme mode on get storage
    MySharedPref.setThemeIsLight(!isLightTheme);
    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();

  static OutlineInputBorder outlineInputBorder=OutlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.mainColor(1), width: 2),
    borderRadius: BorderRadius.circular(2),
  );
}

// App Colors
class AppColors {
  static Color mainColor(double opacity) {
    return const Color(0xFF160647).withOpacity(opacity);
  }

  static Color mainDarkColor(double opacity) {
    return const Color(0xFF000000).withOpacity(opacity);
  }

  static Color secondColor(double opacity) {
    return const Color(0xFF47BAB7).withOpacity(opacity);
  }

  static Color thirdColor(double opacity) {
    return const Color(0xFFB9C5F6).withOpacity(opacity);
  }
  static Color fourthColor(double opacity) {
    return const Color(0xFF8C9FF5).withOpacity(opacity);

  }

  static Color grayColor(double opacity) {
    return const Color(0xFF808080).withOpacity(opacity);
  }

  static Color scaffoldColor(double opacity) {
    return const Color(0xFFEBF2F1).withOpacity(opacity);
  }
}
