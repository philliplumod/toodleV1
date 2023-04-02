import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: customCosmic).copyWith(
      background: customCosmic[900],
      brightness: Brightness.light,
    ),
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: customDavy).copyWith(
      background: customDavy[900],
      brightness: Brightness.dark,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? customCosmic : customDavy[900],
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? customCosmic : customDavy[900]));
}

TextStyle get textStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? customDavy[900] : customCosmic));
}

TextStyle get subtextStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? customCosmic : customDavy[900]));
}

TextStyle get dateTextStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Get.isDarkMode ? customCosmic[900] : customDavy[900]));
}
