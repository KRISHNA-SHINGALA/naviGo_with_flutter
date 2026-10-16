
import 'package:flutter/material.dart';

import 'a_create_trip.dart';
import 'a_trip_details.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  static const Color primaryBlue = Color(0xFF0056D2);
  static const Color lightBlue = Color(0xFFDCE6FF);

  final List<Map<String, dynamic>> _trips = [
    {
      'title': 'GOA Tour',
      'date': 'Oct 12 - Oct 18, 2026',
      'status': 'CONFIRMED',
      'seats': '14/20 seats',
      'image': 'assets/images/Goa_tour.jpg',
      'color': Colors.green,
    },
    {
      'title': 'Kyoto Heritage Tour',
      'date': 'Nov 05 - Nov 12, 2026',
      'status': 'ON TOUR',
      'seats': '18/18 seats',
      'image': 'assets/images/kyoto_tour.jpg',
      'color': Colors.blue,
    },
    {
      'title': 'Swiss Alps Grand Train',
      'date': 'Dec 01 - Dec 10, 2026',
      'status': 'IN PROGRESS',
      'seats': '08/12 seats',
      'image': 'assets/images/swiss_alps.jpg',
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Admin Overview',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              // Dashboard statistics
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      title: 'Total Trips',
                      value: '1,284',
                      icon: Icons.map_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(
                      title: 'Total Revenue',
                      value: '₹45.2k',
                      icon: Icons.payments_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              // Active trips heading and View All action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      'Manage Active Trips',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminTripDetails(),
                        ),
                      );
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(color: primaryBlue),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Display all active trip cards
              ..._trips.map(
                (trip) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildTripCard(trip),
                ),
              ),

              const SizedBox(height: 8),

              // Create a new trip
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _openCreateTrip,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Create New Trip',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating action button for quick trip creation
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreateTrip,
        backgroundColor: const Color(0xFF3025F5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Build a dashboard statistics card
  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: primaryBlue, size: 22),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  // Build an individual trip card
  Widget _buildTripCard(Map<String, dynamic> trip) {
    final Color statusColor = trip['color'] as Color;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _openTripDetails(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  trip['image'] as String,
                  width: 65,
                  height: 62,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 65,
                      height: 62,
                      color: lightBlue,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.landscape_outlined,
                        color: primaryBlue,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      trip['date'] as String,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        trip['status'] as String,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 4),

              Text(
                trip['seats'] as String,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Navigate to the Create Trip screen
  void _openCreateTrip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AdminCreateTrip(),
      ),
    );
  }

  // Navigate to the Trip Details screen
  void _openTripDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AdminTripDetails(),
      ),
    );
  }
}