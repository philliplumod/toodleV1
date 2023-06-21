import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/models/user_model.dart';
import 'package:toddle/repository/authentication_repository/authentication_repository.dart';
import 'package:toddle/repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final userRepo = Get.put(UserRepository());


  void registerUser(UserModel user) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(user.email, user.password);
    if (error != null) {
      Get.snackbar("Error", error, snackPosition: SnackPosition.BOTTOM);
    } else {
      await userRepo.createUser(user);
    }
  }
}
