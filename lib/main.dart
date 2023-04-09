import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toddle/controllers/wrapper_controller.dart';
import 'package:toddle/db/db_helper.dart';
import 'package:toddle/services/notify_helper.dart';
import 'package:toddle/Pages/splashscreen.dart';
import 'package:toddle/utilities/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await DBHelper.initDb();
  await GetStorage.init();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: Get.put(WrapperController()).theme,
      // themeMode: ThemeMode.system,
      home: const SplashScreen()));
}
