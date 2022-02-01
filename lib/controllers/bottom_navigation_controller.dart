import 'package:get/get.dart';

/// Bottom Navigator Controller - Controls the current index of the navigator
class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}