// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test_1/home_page.dart';
import 'package:flutter_test_1/sign_in_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class SignSignUp extends GetxController {
  static SignSignUp instance = Get.find();
  RxBool isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => Homepage());
      // return "Logged In";
    } catch (e) {
      Get.snackbar('Alert', e.toString());
      // return e.toString() + "errorrrrrrrrrrr";
    }
  }

  logout() {
    _auth.signOut();
    Get.offAll(const LoginPageUI());
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;
        FirebaseDatabase.instance
            .ref()
            .child('users/${FirebaseAuth.instance.currentUser!.uid}')
            .set({
          'name': name,
          'uid': user!.uid,
          'email': email,
          'password': password,
        });
      });
      Get.snackbar('Congratulates', 'Sign Up Completed');
      Get.offAll(() => LoginPageUI());
    } catch (e) {
      Get.snackbar('Alert', e.toString());
    }
  }
}
