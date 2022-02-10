import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String username = "";
  String email = "";
  String password = "";
  String usernameLabel = "username";
  String emailLabel = "e-mail";
  String passwordLabel = "password";

  void submitCredentials(GlobalKey<FormState> formKey) {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      AuthController.instance.register(username, email, password);
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
    }
  }

  String? usernameValidation(String? val) => !(val != null && val.length >= 3) ? "Your username should be 3 characters or longer" : null;
  String usernameSave(String? val) => username = val!;

  String? emailValidation(String? val) => !EmailValidator.validate(val!, true) ? "Invalid e-mail" : null;
  String emailSave(String? val) => email = val!;

  String? passwordValidation(String? val) => !(val != null && val.length >= 6) ? "Your password should be 6 characters or longer" : null;
  String passwordSave(String? val) => password = val!;
}