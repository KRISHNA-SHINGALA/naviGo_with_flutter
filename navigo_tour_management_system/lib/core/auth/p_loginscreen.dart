import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/auth/p_forgot_pass.dart';

class PassengerLogin extends StatefulWidget {
  const PassengerLogin({super.key});

  @override
  State<PassengerLogin> createState() => _PassengerLoginState();
}

class _PassengerLoginState extends State<PassengerLogin> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // NaviGo Theme Colors (UI Image ke hisaab se)
  final Color primaryBlue = const Color(0xFF0056D2);
  final Color lightBlueFill = const Color(0xFFE2EAFB); 

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formkey.currentState!.validate()) {
      // Yahan dashboard navigation aayega
      print("Login Validated!");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // SafeArea aur SingleChildScrollView keyboard overflow rokne ke liye
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // Left align sabhi items ko
                  children: [
                    
                    // ==============================
                    // 1. Email Field
                    // ==============================
                    const Text(
                      "Email ID",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "kshingala@rku.ac.in",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: lightBlueFill,
                        // Border ko hata kar sirf rounded corners rakhe gaye hain
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      validator: (value) => value!.isEmpty ? "Enter Email ID" : null,
                    ),
                    const SizedBox(height: 20),

                    // ==============================
                    // 2. Password Field
                    // ==============================
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "********",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: lightBlueFill,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      validator: (value) => value!.isEmpty ? "Enter Password" : null,
                    ),
                    const SizedBox(height: 8),

                    // ==============================
                    // 3. Forgot Password Link
                    // ==============================
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Yahan Redirect (Navigation) logic lagaya hai
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PasseForgotPass(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ==============================
                    // 4. Login Button
                    // ==============================
                    SizedBox(
                      width: double.infinity,
                      height: 55, // Thoda bada button UI image jaisa
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Pill shape 
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}