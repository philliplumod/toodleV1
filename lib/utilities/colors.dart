import 'package:flutter/material.dart';

Map<int, Color> isabelline = {
  50: const Color.fromRGBO(245, 247, 237, .1),
  100: const Color.fromRGBO(245, 247, 237, .2),
  200: const Color.fromRGBO(245, 247, 237, .3),
  300: const Color.fromRGBO(245, 247, 237, .4),
  400: const Color.fromRGBO(245, 247, 237, .5),
  500: const Color.fromRGBO(245, 247, 237, .6),
  600: const Color.fromRGBO(245, 247, 237, .7),
  700: const Color.fromRGBO(245, 247, 237, .8),
  800: const Color.fromRGBO(245, 247, 237, .9),
  900: const Color.fromRGBO(245, 247, 237, 1),
};

Map<int, Color> darkBurgundy = {
  50: const Color.fromRGBO(48, 48, 48, .1),
  100: const Color.fromRGBO(48, 48, 48, .2),
  200: const Color.fromRGBO(48, 48, 48, .3),
  300: const Color.fromRGBO(48, 48, 48, .4),
  400: const Color.fromRGBO(48, 48, 48, .5),
  500: const Color.fromRGBO(48, 48, 48, .6),
  600: const Color.fromRGBO(48, 48, 48, .7),
  700: const Color.fromRGBO(48, 48, 48, .8),
  800: const Color.fromRGBO(48, 48, 48, .9),
  900: const Color.fromRGBO(48, 48, 48, 1),
};

Map<int, Color> brickRed = {
  50: const Color.fromRGBO(203, 78, 71, .1),
  100: const Color.fromRGBO(203, 78, 71, .2),
  200: const Color.fromRGBO(203, 78, 71, .3),
  300: const Color.fromRGBO(203, 78, 71, .4),
  400: const Color.fromRGBO(203, 78, 71, .5),
  500: const Color.fromRGBO(203, 78, 71, .6),
  600: const Color.fromRGBO(203, 78, 71, .7),
  700: const Color.fromRGBO(203, 78, 71, .8),
  800: const Color.fromRGBO(203, 78, 71, .9),
  900: const Color.fromRGBO(203, 78, 71, 1),
};

Map<int, Color> lightPink = {
  50: const Color.fromRGBO(249, 214, 215, .1),
  100: const Color.fromRGBO(249, 214, 215, .2),
  200: const Color.fromRGBO(249, 214, 215, .3),
  300: const Color.fromRGBO(249, 214, 215, .4),
  400: const Color.fromRGBO(249, 214, 215, .5),
  500: const Color.fromRGBO(249, 214, 215, .6),
  600: const Color.fromRGBO(249, 214, 215, .7),
  700: const Color.fromRGBO(249, 214, 215, .8),
  800: const Color.fromRGBO(249, 214, 215, .9),
  900: const Color.fromRGBO(249, 214, 215, 1),
};

Map<int, Color> paleLavender = {
  50: const Color.fromRGBO(232, 213, 231, .1),
  100: const Color.fromRGBO(232, 213, 231, .2),
  200: const Color.fromRGBO(232, 213, 231, .3),
  300: const Color.fromRGBO(232, 213, 231, .4),
  400: const Color.fromRGBO(232, 213, 231, .5),
  500: const Color.fromRGBO(232, 213, 231, .6),
  600: const Color.fromRGBO(232, 213, 231, .7),
  700: const Color.fromRGBO(232, 213, 231, .8),
  800: const Color.fromRGBO(232, 213, 231, .9),
  900: const Color.fromRGBO(232, 213, 231, 1),
};

Map<int, Color> peach = {
  50: const Color.fromRGBO(255, 225, 201, .1),
  100: const Color.fromRGBO(255, 225, 201, .2),
  200: const Color.fromRGBO(255, 225, 201, .3),
  300: const Color.fromRGBO(255, 225, 201, .4),
  400: const Color.fromRGBO(255, 225, 201, .5),
  500: const Color.fromRGBO(255, 225, 201, .6),
  600: const Color.fromRGBO(255, 225, 201, .7),
  700: const Color.fromRGBO(255, 225, 201, .8),
  800: const Color.fromRGBO(255, 225, 201, .9),
  900: const Color.fromRGBO(255, 225, 201, 1),
};

MaterialColor defaultColor = MaterialColor(0xFFF5F7ED, isabelline);
MaterialColor nightColor = MaterialColor(0xFF303030, darkBurgundy);
MaterialColor custombtnColor = MaterialColor(0xFFCB4E47, brickRed);

MaterialColor customAccentColor1 = MaterialColor(0xFFF9D6D7, lightPink);
MaterialColor customAccentColor2 = MaterialColor(0xFFE8D5E7, paleLavender);
MaterialColor customAccentColor3 = MaterialColor(0xFFFFE1C9, peach);

final colorAnimate = [
  defaultColor,
  nightColor,
  custombtnColor,
  customAccentColor1,
  customAccentColor2,
  customAccentColor3,
];
