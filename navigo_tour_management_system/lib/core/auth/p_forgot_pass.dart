import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/auth/p_otp.dart';
import 'package:navigo_tour_management_system/widgets/reset_link_button.dart';

class PasseForgotPass extends StatefulWidget {
  const PasseForgotPass({super.key});

  @override
  State<PasseForgotPass> createState() => _PasseForgotPassState();
}

class _PasseForgotPassState extends State<PasseForgotPass> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passenger Forgot Password"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter your registered admin email address to reset your password.",
              ),

              const SizedBox(height: 25),

              // Email
              TextFormField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Admin Email ID",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email";
                  }

                  if (!RegExp(
                    r'^[^@]+@[^@]+\.[^@]+',
                  ).hasMatch(value.trim())) {
                    return "Please enter a valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // Send Reset Link
              ResetLinkButton(
                onPressed: () {

                  // Validation
                  if (_formKey.currentState!.validate()) {

                    // Validation successful
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PassengerOTP(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}