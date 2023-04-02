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
  700: const Color(0xCCFFBF9B),
  800: const Color.fromRGBO(255, 191, 155, .9),
  900: const Color.fromRGBO(255, 191, 155, 1),
};

Map<int, Color> cosmicLatte = {
  50: const Color(0x18FFF4E0),
  100: const Color(0x33FFF4E0),
  200: const Color(0x4BFFF4E0),
  300: const Color(0x66FFF4E0),
  400: const Color(0x7EFFF4E0),
  500: const Color(0x99FFF4E0),
  600: const Color(0xB1FFF4E0),
  700: const Color(0xCCFFF4E0),
  800: const Color(0xE4FFF4E0),
  900: const Color(0xFFB9B6B0),
};

Map<int, Color> frechPuce = {
  50: const Color.fromRGBO(79, 32, 13, .1),
  100: const Color.fromRGBO(79, 32, 13, .2),
  200: const Color.fromRGBO(79, 32, 13, .3),
  300: const Color.fromRGBO(79, 32, 13, .4),
  400: const Color.fromRGBO(79, 32, 13, .5),
  500: const Color.fromRGBO(79, 32, 13, .6),
  600: const Color.fromRGBO(79, 32, 13, .7),
  700: const Color.fromRGBO(79, 32, 13, .8),
  800: const Color.fromRGBO(79, 32, 13, .9),
  900: const Color(0xFF4F200D),
};


MaterialColor customDavy = MaterialColor(0xFF4D4D4D, davyGray);
MaterialColor customRed = MaterialColor(0xFFB46060, redWood);
MaterialColor customDeep = MaterialColor(0xFFFFBF9B, deepPeach);
MaterialColor customCosmic = MaterialColor(0xFFFFF4E0, cosmicLatte);
MaterialColor customFrench = MaterialColor(0xFF4F200D, frechPuce);

