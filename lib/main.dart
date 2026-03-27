import 'package:dash/Controllers/Theme_Controller.dart';
import 'package:dash/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Your light theme
      darkTheme: ThemeData.dark(), // Your dark theme
      themeMode: themeController.theme, // React to changes in themeController.theme
      home: const MainScreen(),
    );
  }
}
