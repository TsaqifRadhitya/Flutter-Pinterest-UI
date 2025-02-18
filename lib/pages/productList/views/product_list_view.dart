import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});
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
              'Product List',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
      body: Obx(() => controller.ProductList.value.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff3584FA),
              ),
            )
          : Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: SingleChildScrollView(
                  child: Column(
                spacing: 32,
                children: controller.ProductList.value
                    .map((item) => Container(
                          padding: const EdgeInsets.all(20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 0,
                                    blurRadius: 1),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            spacing: 32,
                            children: [
                              Expanded(
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            item.image,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                            width: 50,
                                            height: 50,
                                          )))),
                              Expanded(
                                  child: Column(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    softWrap: true,
                                    item.title,
                                  ),
                                  Text(item.category),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xff3584FA),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black38,
                                                spreadRadius: 0,
                                                blurRadius: 1),
                                          ]),
                                      width: double.infinity,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Buy Now",
                                            style: TextStyle(
                                                color: Colors.white,fontWeight: FontWeight.bold),
                                          )))
                                  // Text(item.description)
                                ],
                              ))
                            ],
                          ),
                        ))
                    .toList(),
              )),
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
                  icon: Icon(Icons.production_quantity_limits), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: 1,
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
