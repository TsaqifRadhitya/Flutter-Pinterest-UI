import 'package:flutter/material.dart';
import 'package:get_x/Controller/home.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/navigation.dart';
import 'package:get_x/Pages/Home/Widget/FloatingActionButton.dart';

class Profile extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final Navigation navigation = Get.find<Navigation>();
  final int parseNavbar = 1;
  Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Profile'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp), label: 'Subject'),
          BottomNavigationBarItem(
              icon: Icon(Icons.energy_savings_leaf_rounded), label: 'Growing'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        currentIndex: 3,
        onTap: (index) => navigation.navigate(index),

      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
