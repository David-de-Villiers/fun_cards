// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fun_cards/controllers/bottom_navigation_controller.dart';
import 'package:fun_cards/screens/homepage.dart';
import 'package:fun_cards/screens/page1.dart';
import 'package:fun_cards/screens/page2.dart';
import 'package:sizer/sizer.dart';

class NavigationPage extends StatelessWidget {

  BottomNavigationController bottomNavigationController = Get.find();

  final screens = [
    HomePage(),
    Page1(),
    Page2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: bottomNavigationController.selectedIndex.value,
        children: screens,
      )),
      bottomNavigationBar: Obx(() => Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 0,
          onTap: (index) {
            bottomNavigationController.changeIndex(index);
          },
          currentIndex: bottomNavigationController.selectedIndex.value,
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home", tooltip: ""),
            BottomNavigationBarItem(icon: Icon(Icons.gamepad_rounded), label: "Games List", tooltip: ""),
            BottomNavigationBarItem(icon: Icon(Icons.info_outline_rounded), label: "About", tooltip: ""),
          ],
        ),
      ))
    );
  }
}
