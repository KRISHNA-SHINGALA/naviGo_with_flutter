
import 'package:flutter/material.dart';

class AdminTopBar extends StatelessWidget {
  const AdminTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // NaviGo Logo and Name
            Row(
              children: [
                const Icon(
                  Icons.route,
                  size: 48,
                  color: Color(0xFF0056D2),
                ),
                const SizedBox(width: 5),
                const Text(
                  'NaviGo',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0056D2),
                  ),
                ),
              ],
            ),

            // Profile Icon
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFE0E0E0),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  // Profile action
                },
                icon: const Icon(
                  Icons.person_outline,
                  size: 34,
                  color: Color(0xFF222222),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
