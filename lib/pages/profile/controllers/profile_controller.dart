import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:get_x/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final SupabaseProvider = Get.find<supabaseProvider>();

  final count = 0.obs;

  void logout() async {
    await SupabaseProvider.logOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void increment() => count.value++;
}
