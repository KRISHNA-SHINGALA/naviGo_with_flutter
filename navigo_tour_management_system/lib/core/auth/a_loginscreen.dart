import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/a_dashboard.dart';
import 'package:navigo_tour_management_system/core/auth/a_forgot_pass.dart';
import 'package:navigo_tour_management_system/widgets/login_button.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),

        child: Form(
          key: _formkey,

          child: SingleChildScrollView(
            child: Column(
              children: [
                // ---------------- EMAIL ----------------

                TextFormField(
                  controller: _emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }

                    if (!value.contains("@")) {
                      return "Please enter valid email";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // ---------------- PASSWORD ----------------

                TextFormField(
                  controller: _passwordController,

                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    }

                    // 1 capital
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return "Password must contain 1 capital letter";
                    }

                    // 1 small
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return "Password must contain 1 small letter";
                    }

                    // 2 numbers
                    if (!RegExp(r'(.*\d){2}').hasMatch(value)) {
                      return "Password must contain 2 numbers";
                    }

                    // 2 special characters
                    if (!RegExp(
                      r'(.*[!@#$%^&*(),.?":{}|<>_\-]){2}',
                    ).hasMatch(value)) {
                      return "Password must contain 2 special characters";
                    }

                    //8 characters
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),

                
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminForgotPass(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF0056D2),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                
                LoginButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminDashboard(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
