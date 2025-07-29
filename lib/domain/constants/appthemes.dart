import 'package:flutter/material.dart';
import 'appcolors.dart';

class Appthemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonLight,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconLight),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColors.hintLight),
      bodyLarge: TextStyle(color: AppColors.numberTextLight),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFieldLight,
      filled: true,
      hintStyle: const TextStyle(color: AppColors.hintLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonDark,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconDark),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColors.hintDark),
      bodyLarge: TextStyle(color: AppColors.numberTextDark),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFieldDark,
      filled: true,
      hintStyle: const TextStyle(color: AppColors.hintDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
