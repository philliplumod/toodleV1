import 'package:flutter/material.dart';
import 'package:toddle/utilities/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? textColor;
  const CustomElevatedButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.width,
      this.radius,
      this.color,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
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
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
