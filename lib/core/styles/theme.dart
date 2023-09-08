import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

ThemeData createTheme() {
  return ThemeData(
    primaryColor: AppColors.blue,
    fontFamily: 'SFProDisplay',
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightestGrey1,
    appBarTheme: _createAppBarTheme(),
    textTheme: _createTextTheme(),
  );
}

AppBarTheme _createAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: AppColors.white,
    centerTitle: true,
    toolbarHeight: 101,
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
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 26.4 / 22,
      color: AppColors.black,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      height: 36 / 30,
      color: AppColors.black,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 19.2 / 16,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 16.8 / 14,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17,
      height: 20.4 / 17,
      color: AppColors.lightGrey,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 19.2 / 16,
      color: AppColors.blue,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 19.2 / 16,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 16.8 / 14,
      color: AppColors.grey,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 14.4 / 12,
      color: AppColors.lightGrey,
    ),
  );
}
