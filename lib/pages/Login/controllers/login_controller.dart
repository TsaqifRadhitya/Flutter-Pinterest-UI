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
    if (Get.isSnackbarOpen) return;
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
    if (await SupabaseProvider.LoginWithGoogle()) {
      Get.snackbar("login", "Success");
    } else {
      Get.snackbar("login", "Your Google Account Is Not Exist For This App");
    }
  }



  void increment() => count.value++;
}
