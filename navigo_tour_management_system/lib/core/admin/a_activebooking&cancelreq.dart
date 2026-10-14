import 'package:flutter/material.dart';
import 'a_activebooking.dart'; // Import active bookings list
import 'a_cancelreq.dart';     // Import cancel requests list

class APassengersRequests extends StatefulWidget {
  const APassengersRequests({super.key});

  @override
  State<APassengersRequests> createState() => _APassengersRequestsState();
}

class _APassengersRequestsState extends State<APassengersRequests> {
  // Variable to track which tab is selected
  bool isActiveBookings = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Page Title
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Passengers & Requests',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Toggle Buttons Container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // Active Bookings Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isActiveBookings = true; // Switch to Active Bookings
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isActiveBookings ? Colors.blue.shade800 : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Active Bookings',
                          style: TextStyle(
                            color: isActiveBookings ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Cancellation Requests Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isActiveBookings = false; // Switch to Cancel Requests
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: !isActiveBookings ? Colors.blue.shade800 : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Cancellation Requests',
                          style: TextStyle(
                            color: !isActiveBookings ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Show the selected page here using ternary operator
          Expanded(
            child: isActiveBookings ? const Activebooking() : const CancelRequest(),
          ),
        ],
      ),
    );
  }
}