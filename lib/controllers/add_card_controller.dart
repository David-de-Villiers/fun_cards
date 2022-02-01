import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Add Card Controller - determines whether input data is valid and creates
/// prompt card in Firebase
class AddCardController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();

  String cardText = "";
  String cardLabel = "new card prompt";

  void submitText() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      submitCard();
    }
  }

  void submitCard() {
    // Complete Firebase Card Submission
    Get.snackbar(
      "Alert",
      cardText,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 0,
      // borderColor: Colors.black,
      // borderWidth: 2,
      leftBarIndicatorColor: Colors.black,
    );
    textController.clear();
  }

  String cardSave(String? val) => cardText = val!;
  String? cardValidation(String? val) => (val != null && val.isEmpty)
      ? "Invalid text"
      : null;
}