// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/controllers/add_card_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fun_cards/controllers/login_controller.dart';
import 'package:fun_cards/widgets/custom_circle_button.dart';
import 'package:fun_cards/widgets/custom_form_field.dart';
import 'package:fun_cards/widgets/responsive_navbar.dart';
import 'package:sizer/sizer.dart';

class AddCardPage extends GetResponsiveView<AddCardController> {
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

            /// Card Text Form
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Page title text
                  Text(
                    "Add Card",
                    style: GoogleFonts.mulish(fontSize: titleText(), color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 48),

                  /// Card Contents Form Field (Custom)
                  SizedBox(
                    width: 256,
                    child: CustomFormField(
                      textController: controller.textController,
                      classController: controller,
                      validationFunction: (val) => controller.cardValidation(val),
                      saveFunction: (val) => controller.cardSave(val),
                      hint: "card content",
                      icon: CupertinoIcons.textformat,
                      minLines: 14,
                      fontSize: 20,
                      shadowHeight: 350,
                    ),
                  ),
                  SizedBox(height: 48),

                  /// Submission Button
                  CustomCircleButton(icon: Icons.check, onPressed: () => controller.submitText())
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
        return 15.w;
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
