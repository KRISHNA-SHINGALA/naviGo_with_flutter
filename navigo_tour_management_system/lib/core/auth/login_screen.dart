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
        backgroundColor: Colors.white, // Pure white background
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              // Poore page par ek uniform padding lagayi hai (left/right 24)
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ==============================
                  // 1. Top Illustration / Logo
                  // ==============================
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Rounded corners image ke liye
                    child: Image.asset(
                      'assets/images/navigo_login_logo.png',
                      width: double.infinity, // Full width lega padding ke andar
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ==============================
                  // 2. Welcome Text
                  // ==============================
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // ==============================
                  // 3. Subtitle
                  // ==============================
                  const Text(
                    'Sign in to manage your luxury tour experiences.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ==============================
                  // 4. Tab Bar (Passenger / Admin)
                  // ==============================
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9), // Light grey background
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: const Color(0xFF0056D2), // Active color (Blue)
                      unselectedLabelColor: Colors.grey.shade600, // Inactive color (Grey)
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                      dividerColor: Colors.transparent, // Niche ki line hatane ke liye
                      tabs: const [
                        Tab(text: "Passenger"),
                        Tab(text: "Admin"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ==============================
                  // 5. TabBarView (The Login Forms)
                  // ==============================
                  SizedBox(
                    height: 320, // Height 275 se 320 ki hai taaki error messages overflow na ho
                    child: const TabBarView(
                      // Swiping disable ki hai taaki form type karte waqt achanak tab change na ho
                      physics: NeverScrollableScrollPhysics(), 
                      children: [
                        PassengerLogin(),
                        AdminLogin(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ==============================
                  // 6. OR SIGN IN WITH
                  // ==============================
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey.shade300, thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR SIGN IN WITH",
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey.shade300, thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // ==============================
                  // 7. Google Button
                  // ==============================
                  // Note: Agar aapka GoogleButton() same aisa dikhta hai toh aap use use kar sakte hain
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Ensure Google logo image is in assets
                          Image.asset('assets/images/google_logo.png', height: 24, errorBuilder: (c, e, s) => const Icon(Icons.g_mobiledata, color: Colors.blue, size: 30)),
                          const SizedBox(width: 12),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ==============================
                  // 8. Sign Up
                  // ==============================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Sign Up page")),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
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
          ),
        ),
      ),
    );
  }
}