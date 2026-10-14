import 'package:flutter/material.dart';
import 'a_create_trip.dart'; 
import 'admin_main_layout.dart'; // Main layout import to go back safely

class AdminTripDetails extends StatelessWidget {
  const AdminTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trip Information', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text("Trip Image Here")),
            ),
            const SizedBox(height: 15),

            // Trip Name & Date
            const Text(
              'Mahakaleshwar Temple, Ujjain',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text('Oct 12 - Oct 18, 2026', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // Passengers List Header
            const Text('Booked Passengers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Dummy Passengers List
            _buildPassengerCard('Vihaan', '1234567890', 'Seat 12'),
            _buildPassengerCard('Kavya', '1234567890', 'Seat 08'),
            _buildPassengerCard('Yaksh', '1234567890', 'Seat 21'),
            
            const SizedBox(height: 20),

            // Edit Trip Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Go to Create/Edit Trip page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminCreateTrip()),
                  );
                },
                child: const Text('Edit Trip'),
              ),
            ),
            const SizedBox(height: 10),

            // Cancel Trip Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Show confirmation dialog before canceling
                  _showCancelDialog(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Cancel Trip', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simple function to build passenger details card
  Widget _buildPassengerCard(String name, String phone, String seat) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.grey.shade100,
      elevation: 0,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(phone),
        trailing: Text(seat, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // Function to show cancel confirmation popup
  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Trip?'),
        content: const Text('Are you sure you want to cancel this trip?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No, Keep it'),
          ),
          TextButton(
            onPressed: () {
              // Removes all pages and goes back to Dashboard (Main Layout)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AdminMainLayout()),
                (route) => false, // Clears history
              );
            },
            child: const Text('Yes, Cancel', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}