
import 'package:flutter/material.dart';

import 'package:navigo_tour_management_system/core/passenger/passenger_profile_screen.dart';

class PassengerTopBar extends StatelessWidget {
  final VoidCallback? onProfileTap;

  const PassengerTopBar({
    super.key,
    this.onProfileTap,
  });

  void _openProfile(BuildContext context) {
    if (onProfileTap != null) {
      onProfileTap!();
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PassengerProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0056D2);

    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/NaviGo_logo_only.png',
            height: 36,
            width: 42,
            fit: BoxFit.contain,
          ),

          GestureDetector(
            onTap: () => _openProfile(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFE0E0E0),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                size: 22,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
