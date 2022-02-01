// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/controllers/add_card_controller.dart';
import 'package:fun_cards/controllers/auth_controller.dart';
import 'package:fun_cards/controllers/bottom_navigation_controller.dart';
import 'package:fun_cards/screens/add_card_page.dart';
import 'package:get/get.dart';
import 'package:fun_cards/constants/style.dart';
import 'package:fun_cards/controllers/login_controller.dart';
import 'package:fun_cards/controllers/signup_controller.dart';
import 'package:fun_cards/screens/login_page.dart';
import 'package:fun_cards/screens/navigation_page.dart';
import 'package:fun_cards/screens/signup_page.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDZj8WofDBNp7KxW80MAMeCa9WyFzXdUqI",
        appId: "1:343400365562:web:e6f287c0810c4020587843",
        messagingSenderId: "343400365562",
        projectId: "fun-cards-1b79b"
    )
  ).then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  LoginController loginController = Get.put(LoginController());
  SignUpController signUpController = Get.put(SignUpController());
  AddCardController addCardController = Get.put(AddCardController());
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialRoute: "/LoginPage",
        getPages: [
          GetPage(name: "/LoginPage", page: () => LoginPage()),
          GetPage(name: "/NavigationPage", page: () => NavigationPage()),
          GetPage(name: "/SignUpPage", page: () => SignUpPage()),
          // GetPage(name: "/LoginPage", page: () => LoginPage())
        ],
        // home: NavigationPage(),
        // routes: ,
        // home: LoginPage(),
        debugShowCheckedModeBanner: false,
        theme: theme,
      );
    });
  }
}

