import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: defaultColor).copyWith(
      background: defaultColor,
      brightness: Brightness.light,
    ),
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: nightColor).copyWith(
      background: nightColor,
      brightness: Brightness.dark,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? defaultColor : nightColor,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? defaultColor : nightColor));
}

TextStyle get textStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? defaultColor : nightColor));
}

TextStyle get subtextStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? defaultColor : nightColor));
}

TextStyle get dateTextStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Get.isDarkMode ? defaultColor : nightColor));
}
