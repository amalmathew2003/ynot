import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ynot_machine_test/screen/details_screen.dart';
import 'package:ynot_machine_test/screen/home_screen.dart';
import 'package:ynot_machine_test/screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/details', page: () => DetailsScreen()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
