import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/auth/a_loginscreen.dart';
import 'package:navigo_tour_management_system/core/auth/p_loginscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Logo
            Center(
              child: Image.asset(
                'assets/images/navigo_login_logo.png',
                width: 300,
                height: 300,
              ),
            ),

            // Login
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),

            // Description
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Sign in to manage your luxury tour experiences.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tab Bar
            
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFFECEEF0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: const Color(0xFF0056D2),
                unselectedLabelColor: Colors.black87,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "Passenger"),
                  Tab(text: "Admin"),
                ],
              ),
            ),

            // Tab Screens
            Expanded(
              child: TabBarView(
                children: [
                  PassengerLogin(),
                  AdminLogin(),
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}