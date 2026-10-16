
import 'package:flutter/material.dart';
import 'admin_edit_profile_screen.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final Color primaryBlue = const Color(0xFF0056D2);

  String adminName = 'Krisha Patel';
  String adminEmail = 'admin@navigo.com';
  String adminPhone = '+91 98765 43210';
  String adminRole = 'Trip Administrator';

  Future<void> _openEditProfile() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (_) => AdminEditProfileScreen(
          name: adminName,
          email: adminEmail,
          phone: adminPhone,
          role: adminRole,
        ),
      ),
    );

    if (result != null && mounted) {
      setState(() {
        adminName = result['name'] ?? adminName;
        adminEmail = result['email'] ?? adminEmail;
        adminPhone = result['phone'] ?? adminPhone;
        adminRole = result['role'] ?? adminRole;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: primaryBlue.withAlpha(25),
                    child: Text(
                      _getInitials(adminName),
                      style: TextStyle(
                        color: primaryBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    adminName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF102A43),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    adminRole,
                    style: TextStyle(
                      color: primaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _openEditProfile,
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle('Personal Information'),
            const SizedBox(height: 12),
            _infoCard(
              Icons.person_outline,
              'Full Name',
              adminName,
            ),
            _infoCard(
              Icons.email_outlined,
              'Email Address',
              adminEmail,
            ),
            _infoCard(
              Icons.phone_outlined,
              'Phone Number',
              adminPhone,
            ),
            _infoCard(
              Icons.admin_panel_settings_outlined,
              'Role',
              adminRole,
            ),
            const SizedBox(height: 24),
            _sectionTitle('Account'),
            const SizedBox(height: 12),
            _accountTile(
              Icons.lock_outline,
              'Change Password',
              'Password settings',
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Connect your password management screen here.',
                    ),
                  ),
                );
              },
            ),
            _accountTile(
              Icons.help_outline,
              'Help & Support',
              'Get assistance with NaviGo',
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Help & Support selected'),
                  ),
                );
              },
            ),
            _accountTile(
              Icons.info_outline,
              'About NaviGo',
              'Trip management system',
              () {
                showAboutDialog(
                  context: context,
                  applicationName: 'NaviGo',
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'Trip Management System',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty || parts.first.isEmpty) {
      return 'A';
    }

    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color(0xFF102A43),
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryBlue.withAlpha(20),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryBlue, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF102A43),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _accountTile(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: primaryBlue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
