import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toddle/db/db_helper.dart';
import 'package:toddle/services/notify_helper.dart';
import 'package:toddle/ui/homepage.dart';
import 'package:toddle/ui/splashscreen.dart';
import 'package:toddle/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await DBHelper.initDb();
  await GetStorage.init();
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: [SystemUiOverlay.top],
  // );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: MyTheme.lightTheme,
    darkTheme: MyTheme.darkTheme,
    themeMode: ThemeMode.system,
    // home: const HomePage(),
     home: const SplashScreen() 
  ));
}
