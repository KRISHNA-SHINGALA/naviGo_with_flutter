import 'package:flutter/material.dart';

class PassengerTopBar extends StatelessWidget {
  final VoidCallback onProfileTap; // Profile pe click detect karne ke liye

  const PassengerTopBar({super.key, required this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = const Color(0xFF0056D2);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Text(
                "Hello, Krisha!",
                style: TextStyle(fontSize: 24, color: primaryBlue, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          
          // Profile Photo
          GestureDetector(
            onTap: onProfileTap, // Yahan click hone par Main Screen redirect karegi
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryBlue, width: 2.5),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person_outline, color: Colors.black87, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}