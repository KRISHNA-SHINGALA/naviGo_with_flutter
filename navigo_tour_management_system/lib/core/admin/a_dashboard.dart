import 'package:flutter/material.dart';
import 'a_create_trip.dart';
import 'a_trip_details.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title
              const Text(
                'Admin Overview',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 18),

              // Top Statistics Boxes (Row with two boxes)
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard('550', 'Total Passengers', Icons.people_outline),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard('₹45.2k', 'Total Revenue', Icons.currency_rupee),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Section Title for Active Trips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Manage Active Trips',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Trip 1 - Clickable to open Trip Details
              GestureDetector(
                onTap: () {
                  // Go to Trip Details page when clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminTripDetails()),
                  );
                },
                child: _buildTripCard(
                  'assets/images/Goa_tour.jpg', // Make sure this image exists
                  'GOA Tour',
                  'Oct 12 - Oct 18, 2026',
                  'CONFIRMED',
                  '14/20 seats',
                  Colors.green,
                ),
              ),
              const SizedBox(height: 14),

              // Trip 2
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminTripDetails()),
                  );
                },
                child: _buildTripCard(
                  'assets/images/spiti_valley.jpg', // Make sure this image exists
                  'Spiti Valley',
                  'Nov 05 - Nov 12, 2026',
                  'ON TOUR',
                  '18/18 seats',
                  Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating button to create a new trip
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Go to Create Trip page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminCreateTrip()),
          );
        },
        backgroundColor: Colors.blue.shade800,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  // Simple function to build a small statistic box
  Widget _buildStatCard(String value, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.blue.shade700),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  // Simple function to build a trip card
  Widget _buildTripCard(String image, String title, String date, String status, String seats, Color statusColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trip Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(image, width: double.infinity, height: 145, fit: BoxFit.cover),
          ),
          // Trip Data
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: statusColor),
                    ),
                    Text(seats, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}