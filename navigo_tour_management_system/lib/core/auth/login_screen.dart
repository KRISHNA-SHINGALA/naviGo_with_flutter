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
            SizedBox(height: 20,),

            // OR SIGN IN WITH
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 10),
  child: Row(
    children: [
      Expanded(
        child: Divider(
          color: Color(0xFFD0D0D0),
          thickness: 1,
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "OR SIGN IN WITH",
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 1,
            color: Color(0xFF303846),
          ),
        ),
      ),

      Expanded(
        child: Divider(
          color: Color(0xFFD0D0D0),
          thickness: 1,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 25),

// Google Sign In Button
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 27),
  child: SizedBox(
    width: double.infinity,
    height: 45,
    child: OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Google Sign In"),
          ),
        );

        // Google authentication yahan connect karna.
      },

      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: const BorderSide(
          color: Color(0xFFCCCCCC),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "G",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4285F4),
            ),
          ),

          SizedBox(width: 12),

          Text(
            "Continue with Google",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  ),
),

const SizedBox(height: 20),

// Sign Up
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      "Don't have an account? ",
      style: TextStyle(
        fontSize: 13,
        color: Color(0xFF596273),
      ),
    ),

    TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sign Up page"),
          ),
        );

        // Sign Up page navigation yahan add karna.
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text(
        "Sign Up",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0056D2),
        ),
      ),
    ),
  ],
),

const SizedBox(height: 20),

            
          ],
        ),
      ),
    );
  }
}