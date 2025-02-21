import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final emailErrorMessage = ''.obs;
  final passwordErrorMessage = ''.obs;
  final confirmPasswordErrorMessage = ''.obs;
  final emailInputField = ''.obs;
  final passwordInputField = ''.obs;
  final confirmPasswordInputField = ''.obs;
  final passwordVisible = true.obs;
  final SupabaseProvider = Get.find<supabaseProvider>();

  void register() async {
    resetErrorMessage();
    if (!GetUtils.isEmail(emailInputField.value)) {
      emailErrorMessage.value = 'Invalid Email';
    }
    if (passwordInputField.value != confirmPasswordInputField.value ||
        confirmPasswordInputField.value.isEmpty) {
      confirmPasswordErrorMessage.value = 'Invalid confirm password';
    }

    if (passwordInputField.value.isEmpty) {
      passwordErrorMessage.value = 'Invalid confirm password';
    }
    if (checkErrorAvailability()) return;
    try {
      await SupabaseProvider.Register(
          emailInputField.value, passwordInputField.value);
      Get.snackbar('SignUp', 'Success');
    } on AuthApiException catch (e) {
      Get.snackbar('SignUp Failed', e.message);
    }
  }

  void resetErrorMessage() {
    emailErrorMessage.value = '';
    passwordErrorMessage.value = '';
    confirmPasswordErrorMessage.value = '';
  }

  bool checkErrorAvailability() {
    if (emailErrorMessage.value.isEmpty &&
        passwordErrorMessage.value.isEmpty &&
        confirmPasswordErrorMessage.value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
