
import 'package:flutter/material.dart';

import 'a_transaction_history.dart';
import 'a_completedtrips_history.dart';

class Admintransactioncompletedhistory extends StatelessWidget {
  const Admintransactioncompletedhistory({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0056D2);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FB),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'History & Report',
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
                text: 'Transaction History',
              ),
              Tab(
                icon: Icon(Icons.cancel_outlined),
                text: 'Completed Trips',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ATransactionHistory(),
            AdminCompletedTrips(),
          ],
        ),
      ),
    );
  }
}
