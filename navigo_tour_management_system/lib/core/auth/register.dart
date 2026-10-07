import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/a_dashboard.dart';
import 'package:navigo_tour_management_system/core/passenger/p_dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePass = true;
  bool _obscureConfirmPass = true;
  
  String _selectedRole = 'Passenger'; 

  final Color primaryBlue = const Color(0xFF0056D2);
  final Color lightBlueFill = const Color(0xFFE2EAFB);

  // --- UPDATE KIYA GAYA VALIDATE FUNCTION ---
  void _validateData() {
    if (_formKey.currentState!.validate()) {
      // Agar form me koi error nahi hai, tab ye check karega role
      
      if (_selectedRole == 'Admin') {
        // Admin choose kiya hai to Admin Dashboard me jao
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AdminDashboard()),
        );
      } else {
        // Passenger choose kiya hai to Passenger Dashboard me jao
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PassDashboard()),
        );
      }
    } else {
      print("Validation Failed. Check errors.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD9E4FF), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.3], 
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: primaryBlue, size: 28),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    "Join TourMaster to start managing your logistics and luxury travel experiences.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),

                  _buildLabel("Full Name"),
                  _buildTextField(
                    hint: "Shingala Krishna", 
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please enter your name";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  _buildLabel("Email Address"),
                  _buildTextField(
                    hint: "kshingala@rku.ac.in", 
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please enter your email";
                      if (!value.contains("@")) return "Enter a valid email ID";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  _buildLabel("Phone Number"),
                  _buildTextField(
                    hint: "1234567890", 
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please enter phone number";
                      if (value.length < 10) return "Number must be at least 10 digits";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  _buildLabel("Password"),
                  _buildPasswordField(
                    hint: "********", 
                    controller: _passwordController,
                    isObscure: _obscurePass, 
                    toggleVisiblity: () {
                      setState(() { _obscurePass = !_obscurePass; });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please enter password";
                      if (value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  _buildLabel("Confirm Password"),
                  _buildPasswordField(
                    hint: "********", 
                    controller: _confirmPasswordController,
                    isObscure: _obscureConfirmPass, 
                    toggleVisiblity: () {
                      setState(() { _obscureConfirmPass = !_obscureConfirmPass; });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please confirm your password";
                      if (value != _passwordController.text) return "Passwords do not match";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Select Account Type",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Passenger',
                        groupValue: _selectedRole,
                        activeColor: primaryBlue,
                        onChanged: (String? value) {
                          setState(() { _selectedRole = value!; });
                        },
                      ),
                      const Text("Passenger"),
                      const SizedBox(width: 20),
                      Radio<String>(
                        value: 'Admin',
                        groupValue: _selectedRole,
                        activeColor: primaryBlue,
                        onChanged: (String? value) {
                          setState(() { _selectedRole = value!; });
                        },
                      ),
                      const Text("Admin"),
                    ],
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _validateData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Log in",
                          style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  Widget _buildTextField({
    required String hint, 
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: lightBlueFill,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hint,
    required TextEditingController controller,
    required bool isObscure, 
    required VoidCallback toggleVisiblity,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: lightBlueFill,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey.shade500),
          onPressed: toggleVisiblity,
        ),
      ),
    );
  }
}
