import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/a_completedtrips_history.dart';
//import 'package:navigo_tour_management_system/core/auth/login_screen.dart';
// import 'package:navigo_tour_management_system/core/common/splash_screen.dart';

void main() {
  runApp(const NaviGoApp());
}

class NaviGoApp extends StatelessWidget {
  const NaviGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HistoryScreen(),
    );
  }
}