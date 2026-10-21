
import 'package:flutter/material.dart';

import 'package:navigo_tour_management_system/core/admin/a_dashboard.dart';
import 'package:navigo_tour_management_system/core/admin/admin_profile_screen.dart';
import 'package:navigo_tour_management_system/core/admin/a_history_report.dart';
import 'package:navigo_tour_management_system/core/admin/a_activebooking_cancelreq.dart';
class AdminBottomBar extends StatelessWidget {
  final int currentIndex;

  const AdminBottomBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    // Agar user usi tab par click kare jo already open hai,
    // toh kuch mat karo
    if (currentIndex == index) return;

    Widget nextScreen;

    switch (index) {
      case 0:
        nextScreen = const AdminDashboard();
        break;
      case 1:
        nextScreen = const Admintransactioncompletedhistory();
        break;
      case 2:
        nextScreen = const AdminActiveBookingCancelReq();
        break;
      case 3:
        nextScreen = const AdminProfileScreen();
        break;
      default:
        return;
    }

    // Previous page ko replace karke naya page open hoga
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextScreen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: "Passengers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
