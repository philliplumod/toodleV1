import 'package:flutter/material.dart';
import 'package:toddle/utilities/colors.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    primarySwatch: customCosmic,
    brightness: Brightness.light,
  );
  static final darkTheme =
      ThemeData(primarySwatch: customDavy, brightness: Brightness.dark);
}
