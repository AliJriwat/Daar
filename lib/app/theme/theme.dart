import 'package:flutter/material.dart';
import 'package:daar_project/app/theme/colors.dart';

class AppTheme {
  static _border([Color color = AppColors.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
    borderRadius: BorderRadius.circular(12),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      enabledBorder: _border(),
      focusedBorder: _border(AppColors.borderColorShade),
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: AppColors.white),
      titleLarge: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
  static final lightThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        enabledBorder: _border(),
        focusedBorder: _border(AppColors.borderColorShade),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: AppColors.black),
        titleLarge: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
  );
}