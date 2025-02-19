import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:get_x/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 500),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10)
              ],
              color: Color(0xff3584FA),
            ),
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: const Text(
              'Home Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
      body: Center(
          child: Obx(() => Column(
                mainAxisAlignment: controller.isLoading.value
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(!controller.isLoading.value
                      ? controller.username
                      : "Loading"),
                  if (controller.isLoading.value)
                    Text(controller.count.value.toString())
                ],
              ))),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits), label: "Product"),
              BottomNavigationBarItem(icon: Icon(Icons.task), label: "Todo"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            elevation: 20,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedItemColor: const Color(0xff3584FA),
            onTap: (value) {
              switch (value) {
                case 0:
                  Get.offNamed(Routes.HOME);
                  break;
                case 1:
                  Get.offNamed(Routes.PRODUCT_LIST);
                  break;
                case 2:
                  Get.offNamed(Routes.TODO);
                  break;
                case 3:
                  Get.offNamed(Routes.PROFILE);
                  break;
              }
            },
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
          onPressed: () => controller.increment(),
          icon: const Icon(Icons.plus_one)),
    );
  }
}
