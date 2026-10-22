
import 'package:flutter/material.dart';

import 'package:navigo_tour_management_system/core/admin/admin_bottom_bar.dart';
import 'package:navigo_tour_management_system/core/admin/admin_top_bar.dart';
import 'package:navigo_tour_management_system/core/auth/login_screen.dart';

import 'admin_edit_profile_screen.dart';
import 'a_activebooking_cancelreq.dart';
import 'a_transaction_history.dart';
import 'A_help_support.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() =>
      _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  static const Color primaryBlue = Color(0xFF0056D2);
  static const Color lightBlue = Color(0xFFD8E4FF);

  String adminName = 'Krishna Patel';
  String adminEmail = 'kshingala491@rku.ac.in';
  String adminPhone = '+91 98765 43210';
  String adminRole = 'Trip Administrator';

  // Open Edit Profile screen.
  Future<void> _openEditProfile() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => AdminEditProfileScreen(
          name: adminName,
          email: adminEmail,
          phone: adminPhone,
          role: adminRole,
        ),
      ),
    );

    if (!mounted || result == null) return;

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

  // Open Booking page.
  void _openBookings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const AdminActiveBookingCancelReq(),
      ),
    );
  }

  // Open Payment History page.
  void _openPaymentHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ATransactionHistory(),
      ),
    );
  }

  // Open Help & Support page.
  void _openHelpSupport() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const A_HelpSupport(),
      ),
    );
  }

  // Show About NaviGo information.
  void _openAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'NaviGo',
      applicationVersion: '1.0.0',
      applicationLegalese: 'Tour Management System',
    );
  }

  // Navigate to Login and clear the previous route stack.
  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Existing shared bottom navigation.
      bottomNavigationBar: const AdminBottomBar(
        currentIndex: 3,
      ),

      // Existing shared top navigation.
      body: SafeArea(
        child: Column(
          children: [
            const AdminTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  24,
                  16,
                  24,
                ),
                child: Column(
                  children: [
                    // Admin profile photo placeholder.
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(
                        Icons.person,
                        size: 58,
                        color: Colors.grey.shade500,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Admin name.
                    Text(
                      adminName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202124),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Admin email.
                    Text(
                      adminEmail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 9),

                    // Verified Admin badge.
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified_outlined,
                            size: 17,
                            color: primaryBlue,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Verified Admin',
                            style: TextStyle(
                              color: primaryBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Edit Profile button.
                    SizedBox(
                      width: 220,
                      height: 44,
                      child: OutlinedButton(
                        onPressed: _openEditProfile,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: primaryBlue,
                          side: const BorderSide(
                            color: primaryBlue,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Statistics cards.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.map_outlined,
                            title: 'Total Tours',
                            value: '12',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.groups_outlined,
                            title: 'Total Passengers',
                            value: '1.4k',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // My Bookings.
                    _buildMenuItem(
                      icon: Icons.apartment_outlined,
                      title: 'My Bookings',
                      onTap: _openBookings,
                    ),

                    // Payment History.
                    _buildMenuItem(
                      icon: Icons.payments_outlined,
                      title: 'Payment History',
                      onTap: _openPaymentHistory,
                    ),

                    // Help & Support.
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: _openHelpSupport,
                    ),

                    // About NaviGo.
                    _buildMenuItem(
                      icon: Icons.info_outline,
                      title: 'About NaviGo',
                      onTap: _openAbout,
                    ),

                    // Log Out.
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Log Out',
                      isLogout: true,
                      showArrow: false,
                      onTap: _logout,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Statistics card with sufficient height to avoid overflow.
  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 21,
            color: primaryBlue,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF003F9E),
            ),
          ),
          Text(
            value,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 24,
              height: 1.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0046AC),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable profile menu item.
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
    bool showArrow = true,
  }) {
    final Color itemColor = isLogout
        ? const Color(0xFFD92D20)
        : primaryBlue;

    return Container(
      height: 52,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isLogout
                        ? const Color(0xFFFCE3E1)
                        : const Color(0xFFBDCEE9),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Icon(
                    icon,
                    size: 19,
                    color: itemColor,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isLogout
                          ? const Color(0xFFD92D20)
                          : const Color(0xFF202124),
                    ),
                  ),
                ),

                if (showArrow)
                  Icon(
                    Icons.chevron_right,
                    size: 22,
                    color: Colors.grey.shade600,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
