// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/screens/signup_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fun_cards/controllers/login_controller.dart';
import 'package:fun_cards/widgets/custom_circle_button.dart';
import 'package:fun_cards/widgets/custom_form_field.dart';
import 'package:fun_cards/widgets/responsive_navbar.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetResponsiveView<LoginController> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget? builder() {
    return Scaffold(
      /// Responsive Navigation Bar - App Title
      appBar: ResponsiveNavBar(),
      body: Center(
        /// Wrapped in scroll view to prevent clipping
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: textFieldPadding(), right: textFieldPadding()),

            /// Login Form
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Page title text - "Login"
                  Text(
                    "Login",
                    style: GoogleFonts.mulish(fontSize: titleText(), color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 48),

                  /// Email Text Form Field (Custom)
                  CustomFormField(
                    textController: controller.emailController,
                    classController: controller,
                    validationFunction: (val) => controller.emailValidation(val),
                    saveFunction: (val) => controller.emailSave(val),
                    hint: "e-mail",
                    icon: CupertinoIcons.mail,
                  ),
                  SizedBox(height: 20),

                  /// Password Text Form Field (Custom)
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

                  /// Submission Button
                  CustomCircleButton(icon: Icons.check, onPressed: () => controller.submitCredentials(formKey)),
                  SizedBox(height: 32),

                  /// Go to Sign Up page
                  InkWell(
                    child: Text("I don't have an account yet"),
                    onTap: () => Get.to(SignUpPage()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Controls the padding present on both the left and right sides of the text form fields
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

  /// Controls the size of the page title text
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
