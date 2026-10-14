import 'package:flutter/material.dart';

class CancelRequest extends StatelessWidget {
  const CancelRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // List of cancellation refund requests
        _buildRefundCard(context, 'Garvi', '1234567890', 'Mahakaleshwar Temple', '₹1500', 'Medical emergency'),
        _buildRefundCard(context, 'Foram', '9876543210', 'Solang Valley, Manali', '₹8200', 'Scheduling Conflict'),
      ],
    );
  }

  // Simple widget for refund requests card
  Widget _buildRefundCard(BuildContext context, String name, String phone, String place, String amount, String reason) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.blue.shade50,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Passenger basic info
            Row(
              children: [
                const Icon(Icons.person, color: Colors.blue),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(phone, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Trip place
            Text('Trip: $place', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Refund status tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('PENDING REFUND', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            
            // Amount and Reason
            Text('Refund Amount: $amount', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Reason: $reason', style: const TextStyle(color: Colors.black87)),
            const SizedBox(height: 15),

            // Action Buttons (Approve / Decline)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Show a simple pop-up message for approval
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Refund Approved successfully!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800),
                  child: const Text('Approve', style: TextStyle(color: Colors.white)),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Show a simple pop-up message for decline
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Refund Declined!')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text('Decline', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}