// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/controllers/add_card_controller.dart';
import 'package:fun_cards/controllers/auth_controller.dart';
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

    print(AuthController.currentUserPremium ? "USER IS PREMIUM" : "NOT PREMIUM");
    // controller.premiumMessage();

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
                  SizedBox(height: 16),
                  Text(
                    "Type \"___\" (Three Underscores) where you want other players to place their text, give the number of cards a player should submit when playing with this card, and lastly indicate whether this card is family friendly or not",
                    style: GoogleFonts.mulish(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),

                  /// Card Contents Form Field (Custom)
                  SizedBox(
                    width: 256,
                    child: CustomFormField(
                      textController: controller.textController,
                      classController: controller,
                      validationFunction: (val) => controller.cardContentValidation(val),
                      saveFunction: (val) => controller.cardContentSave(val),
                      hint: "card content",
                      icon: CupertinoIcons.textformat,
                      minLines: 14,
                      fontSize: 20,
                      shadowHeight: 350,
                    ),
                  ),

                  /// Submit Number
                  SizedBox(height: 16),
                  SizedBox(
                    width: 256,
                    child: CustomFormField(
                      textController: controller.numSubmitController,
                      classController: controller,
                      validationFunction: (val) => controller.numSubmitValidation(val),
                      saveFunction: (val) => controller.numSubmitSave(val),
                      customInputType: TextInputType.number,
                      hint: "number of cards to submit",
                      icon: CupertinoIcons.number,
                    ),
                  ),

                  /// Family Friendly check
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Family Friendly?", style: TextStyle(color: Colors.black, fontSize: 18)),
                      Obx(() => Checkbox(
                          value: controller.isFamilyFriendly.value,
                          onChanged: (value) {
                            controller.isFamilyFriendly.value = !controller.isFamilyFriendly.value;
                            print(controller.isFamilyFriendly.value.toString());
                          }))
                    ],
                  ),

                  /// Submission Button
                  SizedBox(height: 48),
                  CustomCircleButton(icon: Icons.check, onPressed: () => controller.submitInfo())
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
