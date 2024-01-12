import 'package:flutter/material.dart';
import 'package:flutter_weather_demo_bloc/screen/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grocery App",
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: const SplashScreen(),
    );
  }
}
