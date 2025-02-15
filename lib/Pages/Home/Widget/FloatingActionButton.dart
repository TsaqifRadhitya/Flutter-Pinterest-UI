import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/home.dart';

class FloatingButton extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  FloatingButton({super.key});


  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: () => controller.clicked += 1,
          style: const ButtonStyle(
            
          ),
          child: const Text('Increment')
          );
          
  }
}