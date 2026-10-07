import 'package:flutter/material.dart';

import 'package:navigo_tour_management_system/core/passenger/p_dashboard.dart';
import 'package:navigo_tour_management_system/core/passenger/p_explore_trips.dart';
import 'package:navigo_tour_management_system/core/passenger/p_upcoming&past.dart';
import 'package:navigo_tour_management_system/core/passenger/p_booking.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_profile_screen.dart';

class PassengerBottomBar extends StatelessWidget {
  final int currentIndex;

  const PassengerBottomBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    // Agar user usi tab par click kare jo open hai, toh kuch mat karo
    if (currentIndex == index) return;

    Widget nextScreen;

    // Yahan index ke hisaab se screen set ho rahi hai
    switch (index) {
      case 0:
        nextScreen = const PassDashboard();
        break;
      case 1:
        nextScreen = const PassengerExploreTrips();
        break;
      case 2:
        nextScreen = const MyTrips();
        break;
      case 3:
        nextScreen = const Booking();
        break;
      case 4:
        nextScreen = const PassengerProfileScreen();
        break;
      default:
        return;
    }

    // pushReplacement se purana page hat jayega aur naya page bina animation ke redirect hoga
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
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
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
            label: "Tours",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_outlined),
            activeIcon: Icon(Icons.book_online),
            label: "Bookings",
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