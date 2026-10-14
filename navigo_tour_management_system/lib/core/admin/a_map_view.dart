import 'package:flutter/material.dart';
import 'a_trip_details.dart'; // Trip details import

class AdminMapView extends StatelessWidget {
  const AdminMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Map View', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dummy Map Image
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
                // Uncomment this and add map image in assets to show map
                // image: DecorationImage(image: AssetImage('assets/images/Admin_map.png'), fit: BoxFit.cover),
              ),
              child: const Center(child: Text("Map Image Here")),
            ),
            const SizedBox(height: 20),

            // Route Analysis Data
            const Text('ROUTE ANALYSIS', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 5),
            const Text('Total Distance: 882 km', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // Proceed Button
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Trip Details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminTripDetails()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800),
                child: const Text('Proceed', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}