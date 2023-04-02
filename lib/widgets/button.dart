import 'package:flutter/material.dart';
import 'package:toddle/utilities/colors.dart';

import '../ui/theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const CustomButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ignore: avoid_returning_null_for_void
      onTap: onTap,
      child: Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: customRed,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Text(
              label,
              style: textStyle.copyWith(color: customCosmic),
            ),
          )),
    );
  }
}
