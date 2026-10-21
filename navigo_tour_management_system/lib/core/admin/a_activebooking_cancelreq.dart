
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/admin_bottom_bar.dart';
import 'a_activebooking.dart';
import 'a_cancelreq.dart';

class AdminActiveBookingCancelReq extends StatelessWidget {
  const AdminActiveBookingCancelReq({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0056D2);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FB),
              bottomNavigationBar: const AdminBottomBar(currentIndex: 2), // Index 2 for Saved/My Trips

        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Bookings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            tabs: [
              Tab(
                icon: Icon(Icons.confirmation_number_outlined),
                text: 'Active Booking',
              ),
              Tab(
                icon: Icon(Icons.cancel_outlined),
                text: 'Cancel Request',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdminActiveBooking(),
            AdminCancelRequest(),
          ],
        ),
      ),
    );
  }
}
