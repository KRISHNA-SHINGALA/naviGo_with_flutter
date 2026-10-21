import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/admin_profile_screen.dart';

class AdminTopBar extends StatelessWidget {
  const AdminTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD0D0D0),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/NaviGo_logo_only.png',
                width: 38,
                height: 42,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              const Text(
                'NaviGo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0056D2),
                ),
              ),
            ],
          ),

          // Navigate to Admin Profile
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFFDADADA),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminProfileScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.person_outline,
                size: 25,
                color: Color(0xFF222222),
              ),
            ),
          ),
        ],
      ),
    );
  }
}