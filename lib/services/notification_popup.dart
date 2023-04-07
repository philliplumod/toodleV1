import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:toddle/ui/theme.dart';

import '../utilities/colors.dart';

class PopService {

  //hello world
    get context => Get.overlayContext;

  void showThemeChangeMessage() {
    final message =
        Get.isDarkMode ? 'Theme changed to light' : 'Theme changed to dark';
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      autoHide: const Duration(seconds: 2),
      dialogBackgroundColor: Get.isDarkMode ? nightColor : defaultColor,
      desc: message,
      descTextStyle: textStyle,
      // btnOkOnPress: () {},
    ).show();
  }

}
