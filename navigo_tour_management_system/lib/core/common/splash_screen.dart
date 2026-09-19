
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0056D2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/navigo_white_logo.png',
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
          width: 35,
          height: 35,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        )   
        ],
      ),
    );
  }
}