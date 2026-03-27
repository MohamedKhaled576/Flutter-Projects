import 'package:dash/Controllers/Screen_Controller.dart';
import 'package:dash/Controllers/Theme_Controller.dart';
import 'package:dash/Screens/Screen1.dart';
import 'package:dash/Screens/Screen2.dart';
import 'package:dash/Screens/Screen3.dart';
import 'package:dash/Screens/Screen4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize your controller
    final ScreenController screenController = Get.put(ScreenController());
    final ThemeController themeController = Get.put(ThemeController());

    final List<Widget> pages = [
      Screen1(),
      Screen2(),
      Screen3(),
      Screen4(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("App with Side Menu"),
      ),
      body: Row(
        children: [
          SideBarAnimated(
            unSelectedTextColor: themeController.isDarkMode.value ? Colors.white : Colors.black,
            selectedIconColor: themeController.isDarkMode.value ? Colors.white : Colors.black,
            unselectedIconColor: themeController.isDarkMode.value ? Colors.white : Colors.black,
            sideBarColor: Colors.black12.withValues(alpha: 0.3), // Use a contrasting surface color
            textStyle: TextStyle(
              fontSize: 18,
              color: Theme.of(context).canvasColor,
            ),
            onTap: (index) {
              screenController.changePage(index);
            },
            sidebarItems: [
              SideBarItem(
                text: 'Screen 1',
                iconSelected: Icons.people,
                iconUnselected: Icons.people_outline,
              ),
              SideBarItem(
                text: 'Screen 2',
                iconSelected: Icons.person_add,
                iconUnselected: Icons.person_add_outlined,
              ),
              SideBarItem(
                text: 'Screen 3',
                iconSelected: Icons.sick,
                iconUnselected: Icons.sick_outlined,
              ),
              SideBarItem(
                text: 'Screen 4',
                iconSelected: Icons.local_hospital,
                iconUnselected: Icons.local_hospital_outlined,
              ),
            ], mainLogoImage: 'assets/test.png', widthSwitch: 0.5,
          ),
          Expanded(
            child: Obx(() {
              // The main content area will reactively update
              // when the `selectedIndex` in the controller changes.
              return pages[screenController.selectedIndex.value];
            }),
          ),
        ],
      ),
    );
  }
}