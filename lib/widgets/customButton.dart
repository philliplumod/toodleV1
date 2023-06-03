import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? radius;
  const CustomElevatedButton({
    Key? key,
    required this.label,
    this.width,
    this.radius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: customAccentColor3,
          foregroundColor: nightColor,
          padding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 20),
          ),
        ),
        child: Text(
          label,
          style: textStyle.copyWith(
            color: nightColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
