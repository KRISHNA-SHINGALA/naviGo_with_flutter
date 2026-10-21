
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';
import 'p_upcoming.dart';
import 'p_past.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  bool upcoming = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: const PassengerBottomBar(currentIndex: 2), // Index 2 for Saved/My Trips
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 20, bottom: 15),
              child: Text(
                'My Trips',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(left: 31, right: 31, bottom: 10),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() { upcoming = true; });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: upcoming ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: upcoming ? const Color(0xff0645AD) : Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() { upcoming = false; });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: upcoming ? Colors.transparent : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Past',
                            style: TextStyle(
                              color: upcoming ? Colors.black54 : const Color(0xff0645AD),
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
            upcoming ? const PUpcoming() : const PPastTrips(),
          ],
        ),
      ),
    );
  }
}