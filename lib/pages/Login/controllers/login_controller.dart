import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final username = "".obs;
  final password = "".obs;
  final errorUsername = "".obs;
  final errorPassword = "".obs;

  //TODO: Implement LoginController

  final count = 0.obs;

  void Login() {
    resetErrorForm();
    if (!GetUtils.isEmail(username.value)) {
      errorUsername.value = 'Invalid Email';
    }

    if (!password.isNotEmpty) {
      errorPassword.value = 'Invalid Password';
    }

    if (errorUsername.isNotEmpty || errorPassword.isNotEmpty) {
      return;
    }

    if (Login_validation()) {
      Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  void resetErrorForm() {
    errorPassword.value = "";
    errorUsername.value = "";
  }

  bool Login_validation() {
    if (username.value == 'tsaqifradhitya@gmail.com' &&
        password.value == 'Tsaqif10!') {
      return true;
    }
    errorUsername.value = 'Invalid Usernama/Password';
    return false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
