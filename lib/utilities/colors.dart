import 'package:flutter/material.dart';

// const Color davyGray = Color(0xFF4D4D4D);
// const Color redWood = Color(0xFFB46060);
// const Color deepPeach = Color(0xFFFFBF9B);
// const Color cosmicLatte = Color(0xFFFFF4E0);

Map<int, Color> davyGray = {
  50: const Color.fromRGBO(77, 77, 77, .1),
  100: const Color.fromRGBO(77, 77, 77, .2),
  200: const Color.fromRGBO(77, 77, 77, .3),
  300: const Color.fromRGBO(77, 77, 77, .4),
  400: const Color.fromRGBO(77, 77, 77, .5),
  500: const Color.fromRGBO(77, 77, 77, .6),
  600: const Color.fromRGBO(77, 77, 77, .7),
  700: const Color.fromRGBO(77, 77, 77, .8),
  800: const Color.fromRGBO(77, 77, 77, .9),
  900: const Color.fromRGBO(77, 77, 77, 1),
};

Map<int, Color> redWood = {
  50: const Color.fromRGBO(255, 191, 155, .1),
  100: const Color.fromRGBO(255, 191, 155, .2),
  200: const Color.fromRGBO(255, 191, 155, .3),
  300: const Color.fromRGBO(255, 191, 155, .4),
  400: const Color.fromRGBO(255, 191, 155, .5),
  500: const Color.fromRGBO(255, 191, 155, .6),
  600: const Color.fromRGBO(255, 191, 155, .7),
  700: const Color.fromRGBO(255, 191, 155, .8),
  800: const Color.fromRGBO(255, 191, 155, .9),
  900: const Color.fromRGBO(255, 191, 155, 1),
};

Map<int, Color> deepPeach = {
  50: const Color.fromRGBO(255, 191, 155, .1),
  100: const Color.fromRGBO(255, 191, 155, .2),
  200: const Color.fromRGBO(255, 191, 155, .3),
  300: const Color.fromRGBO(255, 191, 155, .4),
  400: const Color.fromRGBO(255, 191, 155, .5),
  500: const Color.fromRGBO(255, 191, 155, .6),
  600: const Color.fromRGBO(255, 191, 155, .7),
  700: const Color.fromRGBO(255, 191, 155, .8),
  800: const Color.fromRGBO(255, 191, 155, .9),
  900: const Color.fromRGBO(255, 191, 155, 1),
};

Map<int, Color> cosmicLatte = {
  50: const Color.fromRGBO(255, 244, 224, .1),
  100: const Color.fromRGBO(255, 244, 224, .2),
  200: const Color.fromRGBO(255, 244, 224, .3),
  300: const Color.fromRGBO(255, 244, 224, .4),
  400: const Color.fromRGBO(255, 244, 224, .5),
  500: const Color.fromRGBO(255, 244, 224, .6),
  600: const Color.fromRGBO(255, 244, 224, .7),
  700: const Color.fromRGBO(255, 244, 224, .8),
  800: const Color.fromRGBO(255, 244, 224, .9),
  900: const Color.fromRGBO(255, 244, 224, 1),
};

MaterialColor customDavy = MaterialColor(0xFF4D4D4D, davyGray);
MaterialColor customRed = MaterialColor(0xFFB46060, redWood);
MaterialColor customDeep = MaterialColor(0xFFFFBF9B, deepPeach);
MaterialColor customCosmic = MaterialColor(0xFFFFF4E0, cosmicLatte);
