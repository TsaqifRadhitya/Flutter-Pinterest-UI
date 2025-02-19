import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});
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
      body: Obx(() => controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 32, right: 32),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20,
                  children: controller.todos.value
                      .map((toElement) => Container(
                            width: double.infinity,
                            height: 200,
                            child: Text(toElement.title),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      spreadRadius: 0,
                                      blurRadius: 10),
                                ]),
                          ))
                      .toList())))),
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
                    icon: Icon(Icons.production_quantity_limits),
                    label: "Product"),
                BottomNavigationBarItem(icon: Icon(Icons.task), label: "Todo"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: 2,
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
          )),
      floatingActionButton: IconButton.filled(
        onPressed: ()=> Get.toNamed(Routes.ADD_TODO),
        icon: Icon(Icons.add),
        style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(Size.fromRadius(30))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
