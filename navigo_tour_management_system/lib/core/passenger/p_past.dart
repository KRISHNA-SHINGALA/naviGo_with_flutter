import 'package:flutter/material.dart';

class PPastTrips extends StatefulWidget {
  const PPastTrips({super.key});

  @override
  State<PPastTrips> createState() => _PPastTripsState();
}

class _PPastTripsState extends State<PPastTrips> {
  // Static List Data for Past Trips
  final List<Map<String, String>> trips = [
    {
      'title': 'Kerala',
      'date': 'Dec 05 - Dec 12, 2025',
      'status': 'Confirmed',
      'imagePath': 'assets/images/Kerala.jpg',
    },
    {
      'title': 'Goa',
      'date': 'Oct 12 - Oct 18, 2024',
      'status': 'Confirmed',
      'imagePath': 'assets/images/Goa.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Trips',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              for (final trip in trips)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          trip['imagePath']!,
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                          // Agar image path galat ho ya image na mile to fallback icon dikhega
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 90,
                              width: 90,
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.broken_image, color: Colors.grey),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Confirmed Status Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              trip['status']!,
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Place Name / Title
                      Text(
                        trip['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Dates
                      Text(
                        trip['date']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}