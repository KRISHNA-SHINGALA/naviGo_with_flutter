import 'package:flutter/material.dart';
import 'a_completedtrips_history.dart'; // Import completed trips
import 'a_transaction_history.dart';    // Import transactions

class AHistoryReports extends StatefulWidget {
  const AHistoryReports({super.key});

  @override
  State<AHistoryReports> createState() => _AHistoryReportsState();
}

class _AHistoryReportsState extends State<AHistoryReports> {
  // Boolean variable to switch between tabs
  bool isCompletedTrips = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'History & Reports',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Toggle Buttons
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCompletedTrips = true; // Show completed trips
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isCompletedTrips ? Colors.blue.shade800 : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Completed Trips',
                          style: TextStyle(
                            color: isCompletedTrips ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCompletedTrips = false; // Show transactions
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: !isCompletedTrips ? Colors.blue.shade800 : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                            color: !isCompletedTrips ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Show page based on selection
          Expanded(
            child: isCompletedTrips ? const ACompletedtripsHistory() : const ATransactionHistory(),
          ),
        ],
      ),
    );
  }
}