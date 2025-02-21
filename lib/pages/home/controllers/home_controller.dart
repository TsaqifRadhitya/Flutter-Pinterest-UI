import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final supabase = Get.find<supabaseProvider>();


  @override
  void onReady() {
    super.onReady();
  }


  void increment() => count.value++;
}
