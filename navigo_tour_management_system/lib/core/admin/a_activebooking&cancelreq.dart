
import 'package:flutter/material.dart';
import 'a_activebooking.dart';
import 'a_cancelreq.dart';

class APassengersRequests extends StatefulWidget {
  const APassengersRequests({super.key});

  @override
  State<APassengersRequests> createState() => _APassengersRequestsState();
}

class _APassengersRequestsState extends State<APassengersRequests> {
  bool activeBookings = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Passengers & Requests
            const Padding(
              padding: EdgeInsets.only(
                left: 34,
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'Passengers & Requests',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff0047AB),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Active Bookings / Cancellation Requests
            Container(
              height: 35,
              margin: const EdgeInsets.only(
                left: 39,
                right: 25,
                bottom: 10,
              ),

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),

              child: Row(
                children: [

                  // Active Bookings
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeBookings = true;
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: activeBookings
                              ? const Color(0xff0645AD)
                              : Colors.transparent,

                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: Center(
                          child: Text(
                            'Active Bookings',
                            style: TextStyle(
                              color: activeBookings
                                  ? Colors.white
                                  : Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Cancellation Requests
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeBookings = false;
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: activeBookings
                              ? Colors.transparent
                              : const Color(0xff0645AD),

                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: Center(
                          child: Text(
                            'Cancellation Requests',
                            style: TextStyle(
                              color: activeBookings
                                  ? Colors.black54
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
            activeBookings
                ? const Activebooking()
                : const CancelRequest(),
          ],
        ),
      ),
    );
  }
}