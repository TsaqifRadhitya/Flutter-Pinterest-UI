import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController
  final count = 0.obs;
  final loading = true.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2),()=>{
      loading.value = false,
      Get.offNamed(Routes.LOGIN)
    });
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
