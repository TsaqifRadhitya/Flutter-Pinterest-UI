import 'package:get/get.dart';
import 'package:get_x/Pages/Growing/growing.dart';
import 'package:get_x/Pages/Home/home.dart';
import 'package:get_x/Pages/Profile/profile.dart';
import 'package:get_x/Pages/Subject/subject.dart';

class Navigation extends GetxController {
  void navigate(int index) {
    switch (index) {
      case 0:
        Get.snackbar('Navigate', 'Navigate to Home');
        Get.to(Home());
        break;
      case 1:
        Get.snackbar('Navigate', 'Navigate to Subject');
        Get.to(Subject());
        break;
      case 2:
        Get.snackbar('Navigate', 'Navigate to Profile');
        Get.to(Growing());
        break;
      case 3:
        Get.snackbar('Navigate', 'Navigate to Profile',
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
            animationDuration: const Duration(seconds: 1),
            duration: const Duration(seconds: 1));
        Get.to(Profile(),duration: const Duration(seconds: 1));
        break;
    }
  }
}
