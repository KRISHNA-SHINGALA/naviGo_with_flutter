import 'package:flutter/material.dart';

class ACompletedtripsHistory extends StatelessWidget {
  const ACompletedtripsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Summary Box
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                children: [
                  Text('REVENUE', style: TextStyle(fontSize: 10, color: Colors.blue)),
                  Text('₹4.5L', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text('COMPLETED', style: TextStyle(fontSize: 10, color: Colors.blue)),
                  Text('24', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text('PASSENGERS', style: TextStyle(fontSize: 10, color: Colors.blue)),
                  Text('850', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Recent Completions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 10),

        // List of trips
        _buildTripHistoryCard('Manali Expedition', 'Jan 10 - Jan 15', '₹63,000'),
        _buildTripHistoryCard('Jaipur Tour', 'Feb 17 - Feb 20', '₹52,000'),
        _buildTripHistoryCard('Goa Trip', 'Mar 20 - Mar 26', '₹82,000'),
      ],
    );
  }

  // Simple card widget
  Widget _buildTripHistoryCard(String title, String date, String price) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Text(price, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
    );
  }
}