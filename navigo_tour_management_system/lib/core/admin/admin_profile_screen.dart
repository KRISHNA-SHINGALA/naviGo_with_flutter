import 'package:flutter/material.dart';
import 'admin_edit_profile_screen.dart'; // Import edit profile screen

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40), // Top spacing

            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),

            // User Name and Email
            const Text(
              "Krishna Patel",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "kshingala491@rku.ac.in",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 10),

            // Verified Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Verified Admin",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Edit Profile Button
            OutlinedButton(
              onPressed: () {
                // Go to Edit Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminEditProfileScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Edit Profile", style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 30),

            // Menu List Items
            _buildMenuItem(context, Icons.book, "My Bookings"),
            _buildMenuItem(context, Icons.payment, "Payment History"),
            _buildMenuItem(context, Icons.settings, "App Settings"),
            _buildMenuItem(context, Icons.help, "Help & Support"),
            
            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Log Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              onTap: () {
                // Show logout message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out successfully!")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Simple function to create menu items
  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Just showing a simple message for now
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title clicked")),
        );
      },
    );
  }
}