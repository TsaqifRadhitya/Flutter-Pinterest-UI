import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
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
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 0,
                            blurRadius: 1),
                      ]),
                  child: TextButton(
                    onPressed: () => controller.logout(),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.blueAccent)),
                    child: const Text(
                      'Logout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ))
            ],
          )),
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
            currentIndex: 3,
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
    );
  }
}
