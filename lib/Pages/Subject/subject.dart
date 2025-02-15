import 'package:flutter/material.dart';
import 'package:get_x/Controller/home.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/navigation.dart';

class Subject extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final Navigation navigation = Get.find<Navigation>();
  final int parseNavbar = 1;
  Subject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Subject'),
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
        currentIndex: 1,
        onTap: (index) => navigation.navigate(index),
      ),
    );
  }
}
