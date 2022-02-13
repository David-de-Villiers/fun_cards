import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userID;
  String? username;
  bool isPremium = false;
  bool isAdmin = false;

  UserModel({
    required this.userID,
    required this.username
  });

  Map<String, dynamic> toJson() => {
    "userID": userID,
    "username": username,
    "isPremium": isPremium,
    "isAdmin": isAdmin
  };

}