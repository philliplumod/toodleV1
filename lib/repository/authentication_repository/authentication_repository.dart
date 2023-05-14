import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toddle/Pages/signin.dart';
import 'package:toddle/Pages/signup.dart';
import 'package:toddle/Pages/wrapper.dart';
import 'package:toddle/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SignUp())
        : Get.offAll(() => const MyWrapper());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const MyWrapper())
          : Get.offAll(() => const SignUp());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      debugPrint('FIREBASE AUTH EXCEPTION: ${ex.message}');
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      debugPrint('FIREBASE AUTH EXCEPTION: ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error signing in', e.message!,
          snackPosition: SnackPosition.BOTTOM);
      e.code;
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
