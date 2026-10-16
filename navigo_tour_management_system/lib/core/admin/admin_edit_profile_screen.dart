
import 'package:flutter/material.dart';

class AdminEditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String role;

  const AdminEditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  @override
  State<AdminEditProfileScreen> createState() =>
      _AdminEditProfileScreenState();
}

class _AdminEditProfileScreenState
    extends State<AdminEditProfileScreen> {
  final Color primaryBlue = const Color(0xFF0056D2);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController roleController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
    roleController = TextEditingController(text: widget.role);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    roleController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.pop(
      context,
      <String, String>{
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'role': roleController.text.trim(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: primaryBlue.withAlpha(25),
                    child: Icon(
                      Icons.person_outline,
                      color: primaryBlue,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Update your information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF102A43),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Keep your admin profile up to date.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            _fieldLabel('Full Name'),
            _textField(
              controller: nameController,
              hint: 'Enter your full name',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your full name';
                }

                if (value.trim().length < 2) {
                  return 'Name must contain at least 2 characters';
                }

                return null;
              },
            ),
            const SizedBox(height: 18),
            _fieldLabel('Email Address'),
            _textField(
              controller: emailController,
              hint: 'Enter your email address',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email address';
                }

                final emailPattern =
                    RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                if (!emailPattern.hasMatch(value.trim())) {
                  return 'Please enter a valid email address';
                }

                return null;
              },
            ),
            const SizedBox(height: 18),
            _fieldLabel('Phone Number'),
            _textField(
              controller: phoneController,
              hint: 'Enter your phone number',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your phone number';
                }

                final digits =
                    value.replaceAll(RegExp(r'\D'), '');

                if (digits.length < 10 || digits.length > 15) {
                  return 'Enter a valid phone number';
                }

                return null;
              },
            ),
            const SizedBox(height: 18),
            _fieldLabel('Role'),
            _textField(
              controller: roleController,
              hint: 'Enter your role',
              icon: Icons.admin_panel_settings_outlined,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your role';
                }

                return null;
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveProfile,
                icon: const Icon(Icons.save_outlined),
                label: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: primaryBlue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF102A43),
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: primaryBlue),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E6ED)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E6ED)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryBlue, width: 1.5),
        ),
        errorMaxLines: 2,
      ),
    );
  }
}
