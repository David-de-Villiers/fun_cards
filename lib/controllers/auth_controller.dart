import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/screens/login_page.dart';
import 'package:fun_cards/screens/navigation_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("User not yet logged in");

      if (Get.currentRoute != "/LoginPage") {
        Get.offAllNamed("/LoginPage");
      }
    }

    else {
      print("User is logged in!");
      Get.to(() => NavigationPage());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "Welcome",
        "You have successfully registered!",
        leftBarIndicatorColor: Colors.green,
        backgroundColor: Colors.white,
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM
      );
    } catch(e) {
      Get.snackbar(
          "Account Creation Failed",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          leftBarIndicatorColor: Colors.red,
          backgroundColor: Colors.white
      );
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      Get.snackbar(
          "Login Failed",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          leftBarIndicatorColor: Colors.red,
          backgroundColor: Colors.white
      );
    }
  }
}