import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/utilities/theme.dart';

import '../utilities/colors.dart';

class CustomField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const CustomField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textStyle.copyWith(
                color: Get.isDarkMode ? defaultColor : nightColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 9),
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Get.isDarkMode ? defaultColor : nightColor,
                    width: 2.0),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor: Get.isDarkMode ? defaultColor : nightColor,
                    controller: controller,
                    style: subtextStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subtextStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.colorScheme.background,
                            width: 0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.colorScheme.background,
                            width: 0),
                      ),
                    ),
                  ),
                ),
                // ignore: unnecessary_null_comparison
                widget == null ? Container() : Container(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}
