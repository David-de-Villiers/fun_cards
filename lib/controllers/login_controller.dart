import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/controllers/auth_controller.dart';
import 'package:get/get.dart';

/// Login Page Controller - determines whether input data is valid and logs
/// user in through firebase authentication.
class LoginController extends GetxController {

  /// Form key is used for saving and submitting text, while the email and
  /// password controllers preserves text entered into the form fields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// The email and password strings will contain the information to be
  /// submitted to firebase, while the labels assist users in data entry.
  String email = "";
  String password = "";
  String emailLabel = "e-mail";
  String passwordLabel = "password";

  /// If all values within the form are valid, the form is saved and the values
  /// are used to login the user
  void submitCredentials(GlobalKey<FormState> formKey) {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      AuthController.instance.login(email, password);
      emailController.clear();
      passwordController.clear();
    }
  }

  /// The email and password validation functions determine whether all data
  /// entered is acceptable, and displays an error message if it is not.
  String emailSave(String? val) => email = val!;
  String? emailValidation(String? val) => !EmailValidator.validate(val!, true)
      ? "Invalid e-mail"
      : null;

  String passwordSave(String? val) => password = val!;
  String? passwordValidation(String? val) => !(val != null && val.length > 6)
      ? "Your password should be 6 characters or longer"
      : null;

}