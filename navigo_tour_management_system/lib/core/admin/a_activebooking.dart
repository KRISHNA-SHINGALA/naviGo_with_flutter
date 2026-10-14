import 'package:flutter/material.dart';

class Activebooking extends StatelessWidget {
  const Activebooking({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // List of active passenger bookings
        _buildPassengerCard('Garvi', '1234567890', 'Mahakaleshwar Temple', '2 Seats', 'CONFIRMED', Colors.green),
        _buildPassengerCard('Foram', '9876543210', 'Solang Valley, Manali', '1 Seat', 'PAID', Colors.blue),
        _buildPassengerCard('Bhoomi', '1122334455', 'Jaswant Thada, Rajasthan', '4 Seats', 'CONFIRMED', Colors.green),
        _buildPassengerCard('Vansika', '4538205445', 'Mahakaleshwar Temple', '2 Seats', 'PAID', Colors.blue),
      ],
    );
  }

  // Simple widget to show passenger details
  Widget _buildPassengerCard(String name, String phone, String place, String seats, String status, Color statusColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.blue.shade50,
      elevation: 0, // Flat design without shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            // Profile Icon
            const Icon(Icons.person, size: 40, color: Colors.black54),
            const SizedBox(width: 15),
            
            // Passenger Info (Name, Phone, Place)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(phone, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 5),
                  Text(place, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            
            // Status Tag and Seats info
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor),
                  ),
                ),
                const SizedBox(height: 20),
                Text(seats, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
              ],
            )
          ],
        ),
      ),
    );
  }
}