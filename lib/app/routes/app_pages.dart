import 'package:get/get.dart';

import '../../pages/Login/bindings/login_binding.dart';
import '../../pages/Login/views/login_view.dart';
import '../../pages/Register/bindings/register_binding.dart';
import '../../pages/Register/views/register_view.dart';
import '../../pages/home/bindings/home_binding.dart';
import '../../pages/home/views/home_view.dart';
import '../../pages/productList/bindings/product_list_binding.dart';
import '../../pages/productList/views/product_list_view.dart';
import '../../pages/profile/bindings/profile_binding.dart';
import '../../pages/profile/views/profile_view.dart';
import '../../pages/splashscreen/bindings/splashscreen_binding.dart';
import '../../pages/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
  ];
}
