// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fun_cards/widgets/custom_text.dart';
import 'package:fun_cards/widgets/responsive_navbar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetResponsiveView<GetxController> {

  @override
  Widget? builder() {
    return Scaffold(
      appBar: ResponsiveNavBar(),
      body: Center(
        child: screenText(),
      ),
    );

  }

  Widget screenText() {
    switch (screen.screenType) {
      case ScreenType.Phone:
        return CustomText(text: "Phone", size: 20.sp);
      case ScreenType.Desktop:
        return CustomText(text: "Desktop", size: 20.sp);
      default:
        return CustomText(text: "Default", size: 20.sp);
    }
  }
}