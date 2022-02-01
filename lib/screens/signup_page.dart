// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fun_cards/controllers/signup_controller.dart';
import 'package:fun_cards/widgets/custom_circle_button.dart';
import 'package:fun_cards/widgets/custom_form_field.dart';
import 'package:fun_cards/widgets/custom_text.dart';
import 'package:fun_cards/widgets/responsive_navbar.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends GetResponsiveView<SignUpController> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget? builder() {
    return Scaffold(
      appBar: ResponsiveNavBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: textFieldPadding(), right: textFieldPadding()),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.mulish(fontSize: titleText(), color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 48),
                  // Icon(CupertinoIcons.person, size: 64),
                  // SizedBox(height: 64),
                  CustomFormField(
                    textController: controller.usernameController,
                    classController: controller,
                    validationFunction: (val) => controller.usernameValidation(val),
                    saveFunction: (val) => controller.usernameSave(val),
                    hint: "username",
                    icon: CupertinoIcons.person,
                  ),
                  SizedBox(height: 20),
                  CustomFormField(
                    textController: controller.emailController,
                    classController: controller,
                    validationFunction: (val) => controller.emailValidation(val),
                    saveFunction: (val) => controller.emailSave(val),
                    hint: "e-mail",
                    icon: CupertinoIcons.mail,
                  ),
                  SizedBox(height: 20),
                  CustomFormField(
                    textController: controller.passwordController,
                    classController: controller,
                    validationFunction: (val) => controller.passwordValidation(val),
                    saveFunction: (val) => controller.passwordSave(val),
                    icon: CupertinoIcons.lock,
                    hint: "password",
                    obscureText: true,
                  ),
                  SizedBox(height: 48),
                  CustomCircleButton(icon: Icons.check, onPressed: () => controller.submitCredentials(formKey))
                ],
              ),
            ),
          ),
        ),
        // child: screenText(),
      ),
    );

  }

  double textFieldPadding() {
    switch (screen.screenType) {
      case ScreenType.Phone:
        return 10.w;
      case ScreenType.Desktop:
        return 30.w;
      default:
        return 25.w;
    }
  }

  double titleText() {
    switch (screen.screenType) {
      case ScreenType.Phone:
        return 24.sp;
      case ScreenType.Desktop:
        return 10.sp;
      default:
        return 16.sp;
    }
  }
}