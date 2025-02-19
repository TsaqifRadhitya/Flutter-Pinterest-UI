import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/providers/Supabase.dart';
import 'package:get_x/app/routes/app_pages.dart';

class AddTodoController extends GetxController {
  //TODO: Implement AddTodoController

  final count = 0.obs;
  final title = 'Test'.obs;
  final category = 'Test'.obs;
  final description = 'Test'.obs;
  final supabaseProviderClass = Get.find<supabaseProvider>();
  final progresUpload = false.obs;

  void addTodo() {
    if (progresUpload.value) return;
    progresUpload.value = true;
    supabaseProviderClass.createTodo(title.value, description.value, category.value)
        .then((onValue) async {
      progresUpload.value = false;
      await Get.dialog(const Dialog(
          backgroundColor: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 32,
            children: [Text('Upload Succes Full'), Icon(Icons.check)],
          )));
      Get.offAllNamed(Routes.TODO);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
