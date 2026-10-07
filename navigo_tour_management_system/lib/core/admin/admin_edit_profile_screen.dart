import 'package:flutter/material.dart';

class AdminEditProfileScreen extends StatefulWidget {
  const AdminEditProfileScreen({super.key});

  @override
  State<AdminEditProfileScreen> createState() => _AdminEditProfileScreenState();
}

class _AdminEditProfileScreenState extends State<AdminEditProfileScreen> {
  final Color primaryBlue = const Color(0xFF0056D2);
  final Color lightBlueFill = const Color(0xFFE2EAFB);

  // Controllers to manage form text data
  final TextEditingController _nameController = TextEditingController(text: "Shingala Krishna");
  final TextEditingController _phone1Controller = TextEditingController(text: "1234567890");
  final TextEditingController _emailController = TextEditingController(text: "kshingala491@rku.ac.in");
  // UI image me do baar phone number likha hai, isliye doosra controller
  final TextEditingController _phone2Controller = TextEditingController(text: "1234567890"); 
  final TextEditingController _addressController = TextEditingController(text: "123 Sky Tower, Aviation Way, NY");

  @override
  void dispose() {
    _nameController.dispose();
    _phone1Controller.dispose();
    _emailController.dispose();
    _phone2Controller.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Profile Image with Camera Icon ---
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      // backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // --- Form Fields ---
              _buildLabel("Full Name"),
              _buildTextField(_nameController),
              const SizedBox(height: 16),

              _buildLabel("Phone Number"),
              _buildTextField(_phone1Controller, keyboardType: TextInputType.phone),
              const SizedBox(height: 16),

              _buildLabel("Email Address"),
              _buildTextField(_emailController, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),

              // Image me "Phone Number" dobara diya gaya hai
              _buildLabel("Phone Number"),
              _buildTextField(_phone2Controller, keyboardType: TextInputType.phone),
              const SizedBox(height: 16),

              _buildLabel("Business Address"),
              _buildTextField(_addressController, maxLines: 3), // Multiline text field
              const SizedBox(height: 40),

              // --- Save Changes Button ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for saving changes will go here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile Updated Successfully!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Pill shaped button
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Label helper widget
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  // TextField helper widget
  Widget _buildTextField(TextEditingController controller, {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        filled: true,
        fillColor: lightBlueFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}