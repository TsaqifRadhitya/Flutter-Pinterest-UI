import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/home.dart';
import 'package:get_x/Controller/navigation.dart';
import 'package:get_x/Pages/Home/home.dart';

void main() {
  Get.put(HomeController());
  Get.put(Navigation());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: _navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home()
    );
  }
}