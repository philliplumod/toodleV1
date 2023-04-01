import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PopService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  get context => Get.overlayContext;

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  void showThemeChangeMessage() {
    final message =
        Get.isDarkMode ? 'Theme changed to light' : 'Theme changed to dark';
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,

      autoHide: const Duration(seconds: 2),
      headerAnimationLoop: false,
      title: 'Theme changed',
      desc: message,
      // btnOkOnPress: () {},
    ).show();
  }
}
