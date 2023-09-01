import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

ThemeData createTheme() {
  return ThemeData(
    //brightness: Brightness.light,
    // primaryColor: AppColors.blue,
    fontFamily: 'SFProDisplay',
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lighterGrey2,
    appBarTheme: _createAppBarTheme(),
    textTheme: _createTextTheme(),
  );
}

AppBarTheme _createAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: AppColors.white,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.black,
      size: 12,
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.2,
      color: AppColors.black,
    ),
  );
}

TextTheme _createTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      height: 1.2,
      color: AppColors.black,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.2,
      color: AppColors.black,
    ),
    // headlineMedium: TextStyle(
    //   fontWeight: FontWeight.w500,
    //   fontSize: 18,
    //   height: 1.2,
    //   color: AppColors.black,
    // ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17,
      height: 1.2,
      color: AppColors.lightGrey,
    ),
    labelMedium: TextStyle(
      // orange black white grey
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.2,
    ),
    labelSmall: TextStyle(
      //blue grey
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.2,
    ),
    bodyLarge: TextStyle(
      // grey black darkestGrey
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.2,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.2,
      color: AppColors.grey,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.2,
      color: AppColors.lightGrey,
    ),
  );
}
