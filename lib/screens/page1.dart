// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fun_cards/widgets/custom_text.dart';
import 'package:fun_cards/widgets/responsive_navbar.dart';
import 'package:sizer/sizer.dart';

class Page1 extends GetResponsiveView<GetxController> {

  @override
  Widget? builder() {
    return Scaffold(
      appBar: ResponsiveNavBar(),
      body: Center(
        child: CustomText(text: "Page 1", size: 20.sp),
      ),
    );

  }

  // Widget screenText() {
  //   switch (screen.screenType) {
  //     case ScreenType.Phone:
  //       return Text("Phone");
  //     case ScreenType.Desktop:
  //       return Text("Desktop");
  //     default:
  //       return Text("Default");
  //   }
  // }
}