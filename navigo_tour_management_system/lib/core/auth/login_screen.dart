import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/auth/p_loginscreen.dart';
import 'package:navigo_tour_management_system/core/auth/a_loginscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 0 = Passenger, 1 = Admin
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure white background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // Poore page par ek uniform padding (left/right 24)
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ==============================
                // 1. Top Illustration / Logo
                // ==============================
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/navigo_login_logo.png',
                    width: double.infinity,
                    height: 240, // Thodi height badhayi image ke hisaab se
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),

                // ==============================
                // 2. Welcome Text & Subtitle
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
                const Text(
                  'Sign in to manage your luxury tour experiences.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),

                // ==============================
                // 3. Custom Tab Bar (Passenger / Admin)
                // ==============================
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9), // Light grey background
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTabButton(
                          title: "Passenger",
                          index: 0,
                        ),
                      ),
                      Expanded(
                        child: _buildTabButton(
                          title: "Admin",
                          index: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ==============================
                // 4. Form Section (No fixed height)
                // ==============================
                // Conditional rendering ki wajah se height ki problem nahi aayegi
                _selectedTab == 0 ? const PassengerLogin() : const AdminLogin(),

                const SizedBox(height: 24),

                // ==============================
                // 5. OR SIGN IN WITH
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
                // 6. Google Button
                // ==============================
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
                        Image.asset(
                          'assets/images/google_logo.png',
                          height: 24,
                          errorBuilder: (c, e, s) => const Icon(
                            Icons.g_mobiledata,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
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
                const SizedBox(height: 30),

                // ==============================
                // 7. Sign Up
                // ==============================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
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
    );
  }

  // Helper widget to build tab buttons
  Widget _buildTabButton({required String title, required int index}) {
    bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              )
            : const BoxDecoration(
                color: Colors.transparent,
              ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 14,
            color: isSelected ? const Color(0xFF0056D2) : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}