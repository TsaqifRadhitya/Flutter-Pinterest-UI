import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_x/Controller/home.dart';
import 'package:get/get.dart';
import 'package:get_x/Controller/navigation.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final Navigation navigation = Get.find<Navigation>();
  final int parseNavbar = 1;
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home Page',
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        'Choose your course',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () => Get.snackbar(
                          'Notification', 'Notification is onProgress'),
                      icon: const Icon(
                        Icons.notifications_sharp,
                        size: 40.0,
                        color: Colors.green,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 240, 232, 232),
                  filled: true,
                  suffixIcon: Icon(Icons.search_rounded),
                  labelText: 'Search',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () => {},
                              label: Column(
                                children: [
                                  IconButton.filled(
                                      color: Colors.white,
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.folder_open_outlined,
                                        size: 50,
                                      )),
                                  const Text('Catergory')
                                ],
                              )),
                          TextButton.icon(
                              onPressed: () => {},
                              label: Column(
                                children: [
                                  IconButton.filled(
                                      color: Colors.white,
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.store,
                                        size: 50,
                                      )),
                                  const Text('Bookstore')
                                ],
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () => {},
                              label: Column(
                                children: [
                                  IconButton.filled(
                                      color: Colors.white,
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.play_circle_fill,
                                        size: 50,
                                      )),
                                  const Text('Boutique class')
                                ],
                              )),
                          TextButton.icon(
                              onPressed: () => {},
                              label: Column(
                                children: [
                                  IconButton.filled(
                                      color: Colors.white,
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.emergency_recording_rounded,
                                        size: 50,
                                      )),
                                  const Text('Live course')
                                ],
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () => {},
                              label: Column(
                                children: [
                                  IconButton.filled(
                                      color: Colors.white,
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.task,
                                        size: 50,
                                      )),
                                  const Text('Free course')
                                ],
                              )),
                          TextButton.icon(
                              onPressed: () => {},
                              label: Column(
                                children: [
                                  IconButton.filled(
                                      color: Colors.white,
                                      onPressed: () => {},
                                      icon: const Icon(
                                        Icons.folder_open_outlined,
                                        size: 50,
                                      )),
                                  const Text('Leaderboard')
                                ],
                              )),
                        ],
                      ),
                    ],
                  )),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recomended course',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('More')
                      ],
                    ),
                    Text(
                      'you may also like',
                      style: TextStyle(color: Colors.grey),
                    )
                  ]),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) {
                      return Container(
                        width: 200,
                        color: Colors.pink,
                        margin:
                            EdgeInsets.only(right: 50), // Optional margin between items
                        child: Center(
                          child: Text(
                            'Item ${index + 1}', // Add item text for clarity
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })),
              )
            ],
          ),
        )),
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
        currentIndex: 0,
        onTap: (index) => navigation.navigate(index),
      ),
    );
  }
}
