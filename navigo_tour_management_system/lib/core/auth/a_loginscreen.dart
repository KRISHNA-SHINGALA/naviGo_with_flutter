
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/a_dashboard.dart';
import 'package:navigo_tour_management_system/core/auth/a_forgot_pass.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  // Key used to validate the login form
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Controllers used to access email and password input values
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Colors used in the login screen
  final Color primaryBlue = const Color(0xFF0056D2);
  final Color lightBlueFill = const Color(0xFFE2EAFB);

  @override
  void dispose() {
    // Dispose controllers to release resources
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validate the form and navigate to the dashboard if valid
  void _handleLogin() {
    if (_formkey.currentState!.validate()) {
      // Display a message when all validations pass
      print("Admin Login Validated!");

      // Navigate to the admin dashboard
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminDashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // Connect the form to its validation key
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email field label
          const Text(
            "Email ID",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          // Email input field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "admin@navigo.com",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              filled: true,
              fillColor: lightBlueFill,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),

            // Check whether the email is empty or has an invalid format
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Enter Email ID";
              }

              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value.trim())) {
                return "Enter a valid Email ID";
              }

              // Return null when the email is valid
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Password field label
          const Text(
            "Password",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          // Password input field
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "********",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              filled: true,
              fillColor: lightBlueFill,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),

            // Check whether the password is empty or shorter than 8 characters
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
              }

              if (value.length < 8) {
                return "Password must be at least 8 characters";
              }

              // Return null when the password is valid
              return null;
            },
          ),
          const SizedBox(height: 8),

          // Forgot password button aligned to the right
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigate to the admin forgot password screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminForgotPass(),
                  ),
                );
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Login button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              // Run validation and navigate only when all fields are valid
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),

              // Display the login text and arrow icon
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
