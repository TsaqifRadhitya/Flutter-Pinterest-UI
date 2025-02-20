import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(35),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color(0xff3584FA),
            Color(0xff0348AD),
          ])),
      child: Center(
        child: Column(
          spacing: 32,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sign up with\nyour email address.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: const TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                            labelText: 'Type your email here',
                            border: InputBorder.none,
                            icon: Icon(Icons.email),
                            iconColor: Colors.white),
                      ),
                    ),
                    Text(
                      'error',
                    style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red[900]),
                    )
                  ],
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: const TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                            labelText: 'Choose a password',
                            border: InputBorder.none,
                            icon: Icon(Icons.key),
                            iconColor: Colors.white),
                      ),
                    ),
                    Text(
                      'error',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red[900]),
                    )
                  ],
                ),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: const TextField(
                          decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        labelText: 'Confirm your password',
                        border: InputBorder.none,
                      )),
                    ),
                    Text(
                      'error',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red[900]),
                    )
                  ],
                ),
                Column(
                  spacing: 20,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.green[500]),
                          minimumSize: const WidgetStatePropertyAll(
                              Size.fromHeight(50))),
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0348AD)),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.offNamed(Routes.LOGIN),
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white10),
                          minimumSize:
                              WidgetStatePropertyAll(Size.fromHeight(50))),
                      child: const Text(
                        'I already have an account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
