import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  final count = 0.obs;
  final loading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    Supabase.initialize(
            url: dotenv.env['SUPABASE_URL']!,
            anonKey: dotenv.env['SUPABASE_KEY']!,
            debug: true)
        .then((Supabase) async {
      final supabase = Get.put(supabaseProvider());
      if (await supabase.checkLogin()) {
        await supabase.LoginWithGoogle();
        loading.value = false;
        Get.offAllNamed(Routes.HOME);
      } else {
        loading.value = false;
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
