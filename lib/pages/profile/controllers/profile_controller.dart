import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final SupabaseProvider = Get.find<supabaseProvider>();

  final count = 0.obs;

  void logout() async {
    GoogleSignIn().disconnect();
    await SupabaseProvider.supabase.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void increment() => count.value++;
}
