import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xff3584FA),
                Color(0xff0348AD),
              ])),
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(50.0),
          child: Obx(() => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.loading.value
                      ? 'Waiting For Internet'
                      : 'Ready to use'),
                  if (controller.loading.value)
                    const CircularProgressIndicator()
                ],
              ))),
    );
  }
}
