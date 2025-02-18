import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xff3584FA),
                Color(0xff0348AD),
              ])),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 32.0,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white),
                      color: Colors.white10,
                    ),
                    child: Obx(() => TextFormField(
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            errorText: controller.errorUsername.value.isEmpty
                                ? null
                                : controller.errorUsername.value,
                            labelText: "Email",
                          ),
                          onChanged: (value) =>
                              {controller.username.value = value},
                        ))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white),
                      color: Colors.white10,
                    ),
                    child: Obx(() => TextFormField(
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            errorText: controller.errorUsername.value.isEmpty
                                ? null
                                : controller.errorPassword.value,
                            labelText: "Password",
                          ),
                          onChanged: (value) =>
                              {controller.password.value = value},
                        ))),
                Obx(() => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: controller.password.isEmpty &&
                                controller.username.isEmpty
                            ? Colors.blue[300]
                            : Colors.blue[600],
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                        onPressed: () => controller.Login(),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )))),
                Container(
                  height: 0.5,
                  color: Colors.grey[500],
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: TextButton(
                        onPressed: () => Get.offNamed(Routes.HOME),
                        child: Text(
                          'Google',
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )))
              ],
            ),
          )),
    );
  }
}
