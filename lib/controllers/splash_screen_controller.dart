import 'package:get/get.dart';


class SplashScreenControler extends GetxController {
  static SplashScreenControler get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimate() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    // Get.to(() => const MyWrapper());
    // Get.to(() => const SignUp());
  }
}
