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
    Supabase.initialize(
            url: dotenv.env['SUPABASE_URL']!,
            anonKey: dotenv.env['SUPABASE_KEY']!,
            debug: true)
        .then((Supabase) {
      Get.put(supabaseProvider());
      loading.value = false;
      Get.offNamed(Routes.LOGIN);
    });
  }



  void increment() => count.value++;
}
