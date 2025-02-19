import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final isLoading = false.obs;
  final String username = Get.find<supabaseProvider>().name;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
