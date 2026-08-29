import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // State variables
  bool isPassengerMode = true; // True for Passenger, False for Admin
  bool _isPasswordVisible = false;

  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Colors based on your Figma design
  final Color primaryBlue = const Color(0xFF0056D2);
  final Color lightBlueFill = const Color(0xFFE2E8F0); // For textfields
  final Color greyBackground = const Color(0xFFF1F5F9); // For toggle bar

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() == true) {
      // Role check based on toggle switch
      if (isPassengerMode) {
        print("Logging in as Passenger");
        // Navigator.pushReplacement(...) for Passenger Dashboard
      } else {
        print("Logging in as Admin");
        // Navigator.pushReplacement(...) for Admin Dashboard
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to left
              children: [
                // 1. Top Illustration Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/navigo_login_logo.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // Error builder just in case image is missing during development
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: lightBlueFill,
                      alignment: Alignment.center,
                      child: const Text('Add navigo_login_logo.png in assets'),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 2. Welcome Texts
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Sign in to manage your luxury tour experiences.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // 3. Passenger / Admin Custom Toggle Bar
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: greyBackground,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      // Passenger Tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isPassengerMode = true),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isPassengerMode
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: isPassengerMode
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Text(
                              "Passenger",
                              style: TextStyle(
                                color: isPassengerMode
                                    ? primaryBlue
                                    : Colors.grey.shade700,
                                fontWeight: isPassengerMode
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Admin Tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isPassengerMode = false),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: !isPassengerMode
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: !isPassengerMode
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Text(
                              "Admin",
                              style: TextStyle(
                                color: !isPassengerMode
                                    ? primaryBlue
                                    : Colors.grey.shade700,
                                fontWeight: !isPassengerMode
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 4. Email Label & Field
                const Text(
                  "Email ID",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "example@rku.ac.in",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: lightBlueFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide.none, // Removes the border completely
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Email cannot be blank" : null,
                ),
                const SizedBox(height: 20),

                // 5. Password Label & Field
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "********",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: lightBlueFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(
                        () => _isPasswordVisible = !_isPasswordVisible,
                      ),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Password is required" : null,
                ),
                const SizedBox(height: 8),

                // 6. Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 7. Login Button
                SizedBox(
                  width: double.infinity, // Full width button
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ), // Very rounded like in image
                      ),
                    ),
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
                ),
                const SizedBox(height: 24),

                // 8. OR Divider
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
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 9. Google Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Replace with your Google Logo asset later
                        Image.asset(
                          'assets/images/google_logo.png',
                          height: 24,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.g_mobiledata,
                                color: Colors.black,
                                size: 30,
                              ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 10. Sign Up Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
