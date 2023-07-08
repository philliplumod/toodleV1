import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toddle/repository/authentication_repository/authentication_repository.dart';
import 'package:toddle/repository/user_repository.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  RxString fullName = ''.obs;
  RxString email = ''.obs;

Future<UserModel?> getUserData() async {
  final emailValue = _authRepo.firebaseUser.value?.email;
  if (emailValue != null) {
    debugPrint('Fetching user data for email: $emailValue');
    final userData = await _userRepo.getUserDetails(emailValue);
    if (userData != null) {
      debugPrint('User data: $userData');
      fullName.value = userData.fullName;
      email.value = userData.email;
      return userData;
    } else {
      debugPrint('User data snapshot is null');
    }
  } else {
    Get.snackbar(
      "Error",
      "Login to continue",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  return null;
}

}
