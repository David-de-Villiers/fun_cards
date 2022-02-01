// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_cards/screens/login_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveNavBar extends GetResponsiveView<GetxController> implements PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 56);

  @override
  Widget? builder() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: SizedBox(width: 0),
      actions: [
        InkWell(
            onTap: () => signOut(),
            child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Icon(CupertinoIcons.clear, color: Colors.black)
            )
        )
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sd_card_outlined, color: Colors.black, size: 24),
          SizedBox(width: 8),
          Text("Fun Cards", style: GoogleFonts.mulish(fontSize: 28, color: Colors.black)),
        ],
      ),
      centerTitle: true,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}