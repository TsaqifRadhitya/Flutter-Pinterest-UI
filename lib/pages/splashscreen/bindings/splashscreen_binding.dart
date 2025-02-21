import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
      () => SplashscreenController(),
    );
    Get.lazyPut<supabaseProvider>(() => supabaseProvider());
  }
}
