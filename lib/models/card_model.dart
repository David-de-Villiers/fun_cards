import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  String? documentID;
  late String content;
  late int numSubmit;
  late String fromUser;
  late bool isFamilyFriendly;

  CardModel({
    required this.content,
    required this.numSubmit,
    required this.fromUser,
    required this.isFamilyFriendly
  });

  CardModel.fromSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentID = documentSnapshot.id;
    content = documentSnapshot["content"];
    numSubmit = documentSnapshot["submit"];
    fromUser = documentSnapshot["fromUser"];
    isFamilyFriendly = documentSnapshot["isFamilyFriendly"];
  }

  Map<String, dynamic> toJson() => {
    "content": content,
    "numSubmit": numSubmit,
    "fromUser": fromUser,
    "isFamilyFriendly": isFamilyFriendly
  };
}