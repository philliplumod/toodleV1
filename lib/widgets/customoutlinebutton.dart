import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final String label;
  final String imageAsset;
  const CustomOutlineButton({
    super.key,
    required this.label,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.3,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: Get.isDarkMode
                ? defaultColor
                : nightColor, // set your desired border color
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.008),
              child: Image(
                height: 20,
                image: AssetImage(imageAsset),
              ),
            ),
            Text(
              label,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
