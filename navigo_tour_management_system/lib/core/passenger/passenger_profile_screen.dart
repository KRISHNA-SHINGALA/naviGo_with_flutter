
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/auth/login_screen.dart';
import 'package:navigo_tour_management_system/core/passenger/p_upcoming&past.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';

import 'passenger_edit_profile_screen.dart';

class PassengerProfileScreen extends StatelessWidget {
  const PassengerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = const Color(0xFF0056D2);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const PassengerBottomBar(currentIndex: 3),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Krishna Patel",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "kshingala491@rku.ac.in",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 16),

              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PassengerEditProfileScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: primaryBlue,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Navigate to the My Bookings page.
              _buildMenuCard(
                context,
                Icons.calendar_today_outlined,
                "My Bookings",
                false,
                const MyTrips(),
              ),

              // Navigate to the App Settings page.
              _buildMenuCard(
                context,
                Icons.settings_outlined,
                "App Settings",
                false,
                const AppPage(),
              ),

              // Navigate to the Help & Support page.
              _buildMenuCard(
                context,
                Icons.help_outline,
                "Help & Support",
                false,
                const HelpSupportPage(),
              ),

              // Log out and prevent returning to the profile page.
              _buildMenuCard(
                context,
                Icons.logout,
                "Log Out",
                true,
                null,
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      "Tours Completed",
                      "12",
                      primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      "Loyalty Points",
                      "2.4k",
                      Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    Color valueColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String title,
    bool isLogout,
    Widget? destination,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isLogout
              ? Colors.red.shade200
              : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isLogout
                ? Colors.red.shade50
                : const Color(0xFFE2EAFB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isLogout
                ? Colors.red
                : const Color(0xFF0056D2),
          ),
        ),

        title: Text(
          title,
          style: TextStyle(
            color: isLogout ? Colors.red : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),

        trailing: Icon(
          isLogout ? Icons.logout : Icons.chevron_right,
          color: isLogout ? Colors.red : Colors.grey.shade400,
        ),

        onTap: () {
          if (isLogout) {
            // Clear the current navigation stack and open Login.
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false,
            );
          } else if (destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => destination,
              ),
            );
          }
        },
      ),
    );
  }
}
