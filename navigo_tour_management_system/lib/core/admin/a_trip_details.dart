
import 'package:flutter/material.dart';

import 'a_create_trip.dart';
import 'a_map_view.dart';

class AdminTripDetails extends StatelessWidget {
  const AdminTripDetails({super.key});

  static const Color primaryBlue = Color(0xFF0056D2);
  static const Color lightBlue = Color(0xFFDCE6FF);

  final String tripName = 'Mahakaleshwar Temple, Ujjain';
  final String tripDate = 'Oct 12 - Oct 18, 2026';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App header
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(Icons.route, color: primaryBlue, size: 25),
            SizedBox(width: 7),
            Text(
              'NaviGo',
              style: TextStyle(
                color: primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xFFEFEFEF),
              child: Icon(
                Icons.person,
                color: Colors.black54,
                size: 20,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip cover image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/mahakaleshwar_temple.jpg',
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 190,
                      color: lightBlue,
                      child: const Icon(
                        Icons.temple_hindu,
                        color: primaryBlue,
                        size: 75,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 14),

              // Trip name
              Text(
                tripName,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              // Trip date
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    tripDate,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // View route button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdminMapView(
                          tripTitle: 'Ujjain Trip',
                          originCity: 'Rajkot',
                          destinationCity: 'Ujjain',
                          startDate: '20 Oct 2026',
                          endDate: '22 Oct 2026',
                          busType: 'AC Sleeper',
                          totalSeats: 40,
                          pricePerSeat: 1500,
                          coverImage: null, // You can pass the cover image bytes if available
                        ),                          
                      ),
                    );
                  },
                  icon: const Icon(Icons.map_outlined, size: 19),
                  label: const Text(
                    'View Route',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryBlue,
                    side: const BorderSide(color: primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 26),

              // Passenger section heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Booked Passengers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '24/40',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Passenger list
              _buildPassengerCard(
                name: 'Vihaan',
                phone: '1234567890',
                passengerId: 'P001',
              ),

              _buildPassengerCard(
                name: 'Kavya',
                phone: '1234567890',
                passengerId: 'P002',
              ),

              _buildPassengerCard(
                name: 'Yaksh',
                phone: '1234567890',
                passengerId: 'P003',
              ),

              _buildPassengerCard(
                name: 'Jency',
                phone: '1234567890',
                passengerId: 'P004',
              ),

              const SizedBox(height: 16),

              // Edit trip button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdminCreateTrip(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit Trip'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryBlue,
                    side: const BorderSide(color: primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Cancel trip button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: () => _showCancelDialog(context),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 18,
                  ),
                  label: const Text('Cancel Trip'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build a passenger information card.
  Widget _buildPassengerCard({
    required String name,
    required String phone,
    required String passengerId,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.person,
            size: 23,
            color: Colors.black,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Passenger ID: $passengerId',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 21,
          ),
        ],
      ),
    );
  }

  // Ask for confirmation before cancelling the trip.
  void _showCancelDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Cancel Trip?'),
          content: const Text(
            'Are you sure you want to cancel this trip?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'No, Keep it',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Trip cancellation requested.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Yes, Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
