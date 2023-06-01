import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toddle/Pages/signin.dart';
import 'package:toddle/Pages/signup.dart';
import 'package:toddle/Pages/wrapper.dart';
import 'package:toddle/repository/authentication_repository/exceptions/signin_email_password_failure.dart';

import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  
  late final Rx<User?> firebaseUser;

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SignUp())
        : Get.offAll(() => const SignIn());
  }

  //FUNC
  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const SignIn())
          : Get.to(() => const MyWrapper());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      debugPrint(ex.message);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailAndPasswordFailure.fromCode(e.code);
      debugPrint(ex.message);
      return ex.message;
      // final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      // return ex.message;
    } catch (_) {
      const ex = SignInWithEmailAndPasswordFailure();
      return ex.message;
      // const ex = LogInWithEmailAndPasswordFailure();
      // return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
