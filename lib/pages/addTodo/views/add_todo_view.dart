import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddTodoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => (controller.progresUpload.value ? CircularProgressIndicator() : Text('Ready To Add')))
      ),
      floatingActionButton: IconButton.filled(
          onPressed: () {
            controller.addTodo();
          },
          icon: Icon(Icons.add)),
    );
  }
}
