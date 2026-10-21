import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'a_trip_details.dart'; // Import for navigation

class AdminMapView extends StatefulWidget {
  const AdminMapView({super.key, required String tripTitle, required String originCity, required double pricePerSeat, required String busType, required String destinationCity, required String startDate, required String endDate, required int totalSeats, Uint8List? coverImage});

  @override
  State<AdminMapView> createState() => _AdminMapViewState();
}

class _AdminMapViewState extends State<AdminMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Map View',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map Image Box
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              // If you have the map image in assets, uncomment the below line
              child: Image.asset('assets/images/Admin_map.png', fit: BoxFit.cover),
              // child: const Center(
              //   child: Text('Map Image Here'),
              // ),
            ),
            const SizedBox(height: 20),

            // Route Analysis Section
            const Text(
              'ROUTE ANALYSIS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Total Distance:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '882 km',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 15),

            // Info Boxes (Time and Speed)
            Row(
              children: [
                Expanded(
                  child: _buildInfoBox('Estimated Time', '15 Hours 22 min'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildInfoBox('Avg', '56 km/h'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Proceed Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Trip Details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminTripDetails(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simple function to create info boxes
  Widget _buildInfoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}