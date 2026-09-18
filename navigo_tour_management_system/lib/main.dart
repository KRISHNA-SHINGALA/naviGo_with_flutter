import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/common/splash_screen.dart';

void main() {
  runApp(const NaviGoApp());
}



class NaviGoApp extends StatelessWidget {
  const NaviGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaviGo Tour Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0056D2)),
        useMaterial3: true,
      ),
      home: const SplashScreen(), 
    );
  }
}
