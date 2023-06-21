import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toddle/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created",
            snackPosition: SnackPosition.BOTTOM))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
      debugPrint(error.toString());
      return throw Exception(error);
    });
  }

Future<UserModel?> getUserDetails(String email) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    debugPrint('Number of documents found: ${snapshot.docs.length}');

    if (snapshot.docs.isNotEmpty) {
      final userData = snapshot.docs.first.data();
      return UserModel(
        fullName: userData['fullName'],
        email: userData['email'],
        password: userData['password'],
      );
    } else {
      return null;
    }
  } catch (e) {
    debugPrint('Error fetching user details: $e');
    return null;
  }
}

}
