import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:get_x/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final username = "".obs;
  final password = "".obs;
  final errorUsername = "".obs;
  final errorPassword = "".obs;
  final SupabaseProvider = Get.find<supabaseProvider>();
  final loginLoading = false.obs;

  //TODO: Implement LoginController

  final count = 0.obs;

  void Login() async {
    if (Get.isSnackbarOpen && loginLoading.value) return;
    loginLoading.value = true;
    resetErrorForm();
    if (!GetUtils.isEmail(username.value)) {
      errorUsername.value = 'Invalid Email';
    }

    if (password.value == '') {
      errorPassword.value = 'Invalid Password';
    }

    if (errorUsername.isNotEmpty || errorPassword.isNotEmpty) {
      loginLoading.value = false;
      return;
    }

    if (await Login_validation()) {
      Get.offNamed(Routes.HOME);
    } else {
      errorUsername.value = 'Invalid Email';
    }
  }

  void resetErrorForm() {
    errorPassword.value = "";
    errorUsername.value = "";
  }

  Future<bool> Login_validation() async {
    final bool result =
        await SupabaseProvider.Login(username.value, password.value);
    loginLoading.value = false;
    return result;
  }

  void loginGoogle() async {
    if(loginLoading.value) return;
    loginLoading.value = true;
    final access = await SupabaseProvider.LoginWithGoogle();
    loginLoading.value = false;
    if (access) Get.offNamed(Routes.HOME);
  }

  void increment() => count.value++;
}
