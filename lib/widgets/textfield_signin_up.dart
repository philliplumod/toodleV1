import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utilities/colors.dart';
import '../utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';
import '../utilities/theme.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final IconData? icon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final String? initialValue;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    this.initialValue,
    this.icon,
    this.hint,
    this.label,
    this.onPressed,
    this.suffixIcon,
    this.controller,
    this.obscureText = false, // Default value is set to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        obscureText: obscureText, // Pass the value to the TextFormField
        style: subtextStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Get.isDarkMode ? defaultColor : nightColor,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIcon,
              color: Get.isDarkMode ? defaultColor : nightColor,
              size: 20,
            ),
          ),
          hintText: hint,
          labelText: label,
          labelStyle: subtextStyle,
          hintStyle: subtextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Get.isDarkMode ? defaultColor : nightColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Get.isDarkMode ? defaultColor : nightColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Get.isDarkMode ? defaultColor : nightColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
