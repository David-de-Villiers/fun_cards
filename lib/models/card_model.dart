import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  String? documentID;
  late String content;
  late int submit;
  late String fromUser;
  late bool isFamilyFriendly;

  CardModel({
    required content,
    required submit,
    required fromUser,
    required isFamilyFriendly
  });

  CardModel.fromSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentID = documentSnapshot.id;
    content = documentSnapshot["content"];
    submit = documentSnapshot["submit"];
    fromUser = documentSnapshot["fromUser"];
    isFamilyFriendly = documentSnapshot["isFamilyFriendly"];
  }
}