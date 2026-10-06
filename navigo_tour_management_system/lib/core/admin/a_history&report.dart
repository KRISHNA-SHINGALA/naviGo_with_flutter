
import 'package:flutter/material.dart';
import 'a_completedtrips_history.dart';
import 'a_transaction_history.dart';

class AHistoryReports extends StatefulWidget {
  const AHistoryReports({super.key});

  @override
  State<AHistoryReports> createState() => _AHistoryReportsState();
}

class _AHistoryReportsState extends State<AHistoryReports> {
  bool completedTrips = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // History & Reports
            const Padding(
              padding: EdgeInsets.only(
                left: 42,
                top: 22,
                bottom: 35,
              ),
              child: Text(
                'History & Reports',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Completed Trips / Transactions
            Container(
              height: 35,
              margin: const EdgeInsets.only(
                left: 31,
                right: 33,
                bottom: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),

              child: Row(
                children: [

                  // Completed Trips
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          completedTrips = true;
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: completedTrips
                              ? const Color(0xff0645AD)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: Center(
                          child: Text(
                            'Completed Trips',
                            style: TextStyle(
                              color: completedTrips
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Transactions
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          completedTrips = false;
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: completedTrips
                              ? Colors.transparent
                              : const Color(0xff0645AD),
                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: Center(
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                              color: completedTrips
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page
            completedTrips
                ? const ACompletedtripsHistory()
                : const ATransactionHistory(),
          ],
        ),
      ),
    );
  }
}