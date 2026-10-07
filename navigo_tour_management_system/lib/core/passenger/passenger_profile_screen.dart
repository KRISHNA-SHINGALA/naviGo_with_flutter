import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_top_bar.dart';
import 'passenger_edit_profile_screen.dart';
// Note: Yahan apni Login Screen ki file import karna mat bhoolna, jaise niche likha hai:
// import 'package:navigo_tour_management_system/core/auth/login_screen.dart'; 

class PassengerProfileScreen extends StatelessWidget {
  const PassengerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = const Color(0xFF0056D2);
    // Yahan se lightBlueFill hata diya gaya hai taaki wo warning (yellow line) chali jaye

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
  preferredSize: const Size.fromHeight(60.0), 
  child: PassengerTopBar( // Yahan se 'const' hata diya hai
    onProfileTap: () {
      // Yahan aap profile page par navigate karne ka code likh sakte hain
      // Example: Navigator.push(...);
      print("Profile clicked!");
    },
  ),
),
bottomNavigationBar: const PassengerBottomBar(currentIndex: 0),


      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
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
              const SizedBox(height: 16),

              // --- Name & Email ---
              const Text(
                "Krishna Patel",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                "kshingala491@rku.ac.in",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 16),

              // --- Edit Profile Button ---
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PassengerEditProfileScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryBlue, width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Slight curve
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const SizedBox(height: 24),

              // --- Menu Options List ---
              _buildMenuCard(context, Icons.calendar_today_outlined, "My Bookings", false),
              _buildMenuCard(context, Icons.receipt_long_outlined, "Payment History", false),
              _buildMenuCard(context, Icons.settings_outlined, "App Settings", false),
              _buildMenuCard(context, Icons.help_outline, "Help & Support", false),
              _buildMenuCard(context, Icons.logout, "Log Out", true), // Logout Menu
              
              const SizedBox(height: 20),

              // --- Bottom Stats Cards ---
              Row(
                children: [
                  Expanded(child: _buildStatCard("Tours Completed", "12", primaryBlue)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildStatCard("Loyalty Points", "2.4k", Colors.black87)),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Stats Card (Outlined design)
  Widget _buildStatCard(String title, String value, Color valueColor) {
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
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(color: valueColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Menu Items
  Widget _buildMenuCard(BuildContext context, IconData icon, String title, bool isLogout) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: isLogout ? Colors.red.shade200 : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isLogout ? Colors.red.shade50 : const Color(0xFFE2EAFB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isLogout ? Colors.red : const Color(0xFF0056D2),
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
        trailing: isLogout 
            ? null 
            : Icon(Icons.chevron_right, color: Colors.grey.shade400),
        onTap: () {
          if (isLogout) {
            // LOGOUT LOGIC: Direct Login Screen par bheje aur purani screens clear kar de
            /* 
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
            */
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Logged Out!")));
          }
        },
      ),
    );
  }
}