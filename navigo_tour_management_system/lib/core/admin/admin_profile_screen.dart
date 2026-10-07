import 'package:flutter/material.dart';
import 'admin_edit_profile_screen.dart'; 

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors ko define kiya gaya hai
    final Color primaryBlue = const Color(0xFF0056D2);
    final Color lightBlueFill = const Color(0xFFE2EAFB);

    return Scaffold(
      backgroundColor: Colors.white,
      // Ab yahan koi bottomNavigationBar ya custom AppBar nahi hai
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30), // Thodi spacing taaki top se chipka hua na lage

              // --- Profile Image ---
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                // backgroundImage: AssetImage('assets/images/profile.png'), // Image add karne ke liye isko uncomment karein
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
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 12),

              // --- Verified Admin Badge ---
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: lightBlueFill,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_outlined, color: primaryBlue, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      "Verified Admin",
                      style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Edit Profile Button ---
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminEditProfileScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryBlue, width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const SizedBox(height: 24),

              // --- Stats Cards (Total Tours & Passengers) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(child: _buildStatCard(primaryBlue, lightBlueFill, Icons.map_outlined, "Total Tours", "12")),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard(primaryBlue, lightBlueFill, Icons.people_alt_outlined, "Total Passengers", "1.4k")),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- Menu Options List ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildMenuCard(Icons.domain, "My Bookings", false),
                    _buildMenuCard(Icons.payments_outlined, "Payment History", false),
                    _buildMenuCard(Icons.notifications_none, "App Settings", false),
                    _buildMenuCard(Icons.help_outline, "Help & Support", false),
                    _buildMenuCard(Icons.logout, "Log Out", true),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widget: Stats Card Banane ke liye ---
  Widget _buildStatCard(Color primaryColor, Color fillColor, IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryColor),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(color: primaryColor, fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // --- Helper Widget: Menu Items Banane ke liye ---
  Widget _buildMenuCard(IconData icon, String title, bool isLogout) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isLogout ? Colors.red.shade50 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isLogout ? Colors.red : Colors.grey.shade700,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isLogout ? Colors.red : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        trailing: isLogout 
            ? null 
            : Icon(Icons.chevron_right, color: Colors.grey.shade400),
        onTap: () {
          // Yahan click hone ka logic add kar sakte hain
        },
      ),
    );
  }
}