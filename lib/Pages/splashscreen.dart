import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:toddle/controllers/splash_screen_controller.dart';
import 'package:toddle/utilities/theme.dart';
import 'package:toddle/utilities/colors.dart';
import 'package:toddle/utilities/image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController = Get.put(SplashScreenControler());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimate();
    return Scaffold(
      backgroundColor: Get.isDarkMode ? nightColor : defaultColor,
      body: Obx(
        () => AnimatedOpacity(
          duration: const Duration(seconds: 3),
          opacity: splashScreenController.animate.value ? 1 : 0,
          curve: Curves.linear,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage(splashIcon))
                  .animate(
                      onPlay: (controller) => controller.repeat(reverse: true))
                  .fade(duration: 500.ms, curve: Curves.easeInOutCubic)
                  .then()
                  .shake(
                    hz: 0.5,
                    duration: 5000.ms,
                    curve: Curves.easeInOutCubic,
                  ),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Toodle',
                      textStyle: headingStyle.copyWith(fontSize: 50)),
                ],
                isRepeatingAnimation: true,
                repeatForever: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
