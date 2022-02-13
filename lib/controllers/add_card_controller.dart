import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/constants/firebase_constants.dart';
import 'package:fun_cards/controllers/auth_controller.dart';
import 'package:fun_cards/models/card_model.dart';
import 'package:get/get.dart';

/// Add Card Controller - determines whether input data is valid and creates
/// prompt card in Firebase
class AddCardController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final TextEditingController numSubmitController = TextEditingController();

  String cardText = "";
  String cardLabel = "new card prompt";
  int numSubmit = 0;
  String fromUser = "";
  var isFamilyFriendly = false.obs;

  void submitInfo() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      submitCard();
      textController.clear();
      numSubmitController.clear();
      isFamilyFriendly.value = false;
    }
  }

  void submitCard() async {
    // Complete Firebase Card Submission
    try {
      await createCard(content: cardText, numSubmit: numSubmit, isFamilyFriendly: isFamilyFriendly.value);
      // Get.snackbar(
      //   "Submission Success!",
      //   "$cardText, ${numSubmit.toString()}, ${isFamilyFriendly.toString()}",
      //   snackPosition: SnackPosition.BOTTOM,
      //   borderRadius: 0,
      //   borderColor: Colors.black,
      //   borderWidth: 2,
      //   leftBarIndicatorColor: Colors.green,
      // );
    } catch(e) {
      Get.snackbar(
        "Submission Unsuccessful",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0,
        borderColor: Colors.black,
        borderWidth: 2,
        leftBarIndicatorColor: Colors.red,
      );
    }

    textController.clear();
  }

  String cardContentSave(String? val) => cardText = val!;
  String? cardContentValidation(String? val) => (val != null && val.isEmpty)
      ? "Invalid text"
      : null;

  int numSubmitSave(String? val) => numSubmit = int.parse(val!);
  String? numSubmitValidation(String? val) => ((val != null && val.isEmpty) || (!isInteger(val!)))
      ? "Invalid number"
      : null;


  Future createCard({required String content, required int numSubmit, required bool isFamilyFriendly}) async {

    final cardDocument = FirebaseFirestore.instance.collection(cardsReference).doc();
    final cardInfo = CardModel(content: content, numSubmit: numSubmit, fromUser: AuthController.currentUsername, isFamilyFriendly: isFamilyFriendly);

    final cardJson = cardInfo.toJson();
    await cardDocument.set(cardJson);
  }

  bool isInteger(String str) {
    if(str == null) {
      return false;
    }
    return int.tryParse(str) != null;
  }
}