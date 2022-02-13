// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/controllers/auth_controller.dart';
import 'package:fun_cards/screens/add_card_page.dart';
import 'package:fun_cards/screens/login_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveNavBar extends GetResponsiveView<GetxController> implements PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 56);

  @override
  Widget? builder() {

    bool showAddCard = AuthController.currentUserPremium;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: SizedBox(width: 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.sd_card_outlined, color: Colors.black, size: 24),
          SizedBox(width: 8),
          Text("Fun Cards", style: GoogleFonts.mulish(fontSize: 28, color: Colors.black)),
        ],
      ),
      centerTitle: false,

      actions: [


        InkWell(
            onTap: () => premiumCheck(),
            child: Container(
                padding: EdgeInsets.only(right: 16, bottom: 2),
                child: Center(child: Text("Add Card", style: TextStyle(color: Colors.black, fontSize: 18),))
            )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
          child: VerticalDivider(width: 1, color: Colors.grey),
        ),
        InkWell(
            onTap: () => signOut(),
            child: Container(
                padding: EdgeInsets.only(right: 48, bottom: 2),
                child: Center(child: Text("Log Out", style: TextStyle(color: Colors.black, fontSize: 18),))
            )
        ),


      ],
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void premiumCheck() {
    // if (!AuthController.currentUserPremium) {
    //   Get.snackbar(
    //     "Get Premium to unlock this Feature",
    //     "This Feature is only available to Premium Members",
    //     snackPosition: SnackPosition.BOTTOM,
    //     leftBarIndicatorColor: Colors.red,
    //     backgroundColor: Colors.white,
    //     borderWidth: 2,
    //     borderColor: Colors.black,
    //     borderRadius: 0,
    //     duration: const Duration(seconds: 5),
    //   );
    // }
    //
    // else {
    //   Get.to(AddCardPage(), preventDuplicates: true);
    // }

    Get.to(AddCardPage(), preventDuplicates: true);
  }
}