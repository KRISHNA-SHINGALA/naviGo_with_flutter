import 'package:flutter/material.dart';

// Niche apni baaki screens ke correct paths import karein
import 'a_dashboard.dart';
import 'a_activebooking&cancelreq.dart';
import 'admin_profile_screen.dart';

class AdminMainLayout extends StatefulWidget {
  const AdminMainLayout({super.key});

  @override
  State<AdminMainLayout> createState() => _AdminMainLayoutState();
}

class _AdminMainLayoutState extends State<AdminMainLayout> {
  int _currentIndex = 0;

  // Bottom Navigation Bar ki sabhi screens ki list
  final List<Widget> _screens = [
    const AdminDashboard(),
    const Center(child: Text('Tours Screen (Coming Soon)')), // Placeholder for Tours
    const Center(child: Text('Saved Screen (Coming Soon)')), // Placeholder for Saved
    const APassengersRequests(),
    const AdminProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // ==========================================
      // TOP BAR (APP BAR)
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Bottom border line ke liye
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
        title: Row(
          children: [
            // NaviGo Logo Icon
Image.asset(
  'assets/images/NaviGo_logo_only.png',
  width: 35,
  height: 40,
  fit: BoxFit.contain,
),
            const SizedBox(width: 8),
            // NaviGo Text
            const Text(
              'NaviGo',
              style: TextStyle(
                color: Color(0xFF0056D2),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          // User Profile Icon Button
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(
                Icons.person,
                color: Colors.black54,
                size: 20,
              ),
            ),
          ),
        ],
      ),

      // ==========================================
      // BODY CONTENT
      // ==========================================
      body: _screens[_currentIndex],

      // ==========================================
      // BOTTOM NAVIGATION BAR
      // ==========================================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF0056D2),
          unselectedItemColor: Colors.black87,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus_outlined),
              activeIcon: Icon(Icons.directions_bus),
              label: 'Tours',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              activeIcon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), 
              activeIcon: Icon(Icons.people_alt),
              label: 'Passengers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}