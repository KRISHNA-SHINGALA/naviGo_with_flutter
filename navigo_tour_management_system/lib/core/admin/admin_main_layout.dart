
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/a_activebooking_cancelreq.dart';
import 'package:navigo_tour_management_system/core/admin/a_history_report.dart';

import 'a_dashboard.dart';
import 'a_create_trip.dart';
import 'admin_profile_screen.dart';

class AdminMainLayout extends StatefulWidget {
  const AdminMainLayout({super.key});

  @override
  State<AdminMainLayout> createState() => _AdminMainLayoutState();
}

class _AdminMainLayoutState extends State<AdminMainLayout> {
  final Color primaryBlue = const Color(0xFF0056D2);

  int selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return AdminDashboard();
      case 1:
        return AdminCreateTrip();
      case 2:
        return const Admintransactioncompletedhistory();
      case 3:
        return AdminActiveBookingCancelReq();
      case 4:
        return const AdminProfileScreen();
      default:
        return AdminDashboard();
    }
  }

  Widget _buildNavigator(int index) {
    return Navigator(
      key: navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => _getPage(index),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    if (selectedIndex == index) {
      navigatorKeys[index]
          .currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  Future<bool> _onWillPop() async {
    final currentNavigator = navigatorKeys[selectedIndex].currentState;

    if (currentNavigator != null && currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }

    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FB),
        body: IndexedStack(
          index: selectedIndex,
          children: List.generate(
            5,
            (index) => _buildNavigator(index),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: primaryBlue,
              unselectedItemColor: Colors.grey.shade600,
              selectedFontSize: 11,
              unselectedFontSize: 10,
              showUnselectedLabels: true,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_bus_outlined),
                  activeIcon: Icon(Icons.directions_bus),
                  label: 'Trip',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline),
                  activeIcon: Icon(Icons.people),
                  label: 'Passenger',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  activeIcon: Icon(Icons.account_balance_wallet),
                  label: 'Save',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
