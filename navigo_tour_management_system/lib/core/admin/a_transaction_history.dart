import 'package:flutter/material.dart';

class ATransactionHistory extends StatelessWidget {
  const ATransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Transaction Summary
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Net Income', style: TextStyle(color: Colors.grey)),
              const Text('₹4.2L', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Received: ₹4.5L', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  Text('Refunded: ₹30K', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 10),

        // Transactions list
        _buildTransactionCard('Arjun Malhotra', '+ ₹3,000', Colors.green),
        _buildTransactionCard('Rahul Sharma', '- ₹1,500', Colors.red),
        _buildTransactionCard('Heet Tala', '+ ₹3,500', Colors.green),
      ],
    );
  }

  Widget _buildTransactionCard(String name, String amount, Color amountColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      elevation: 1,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Oct 24, 10:45 AM'),
        trailing: Text(amount, style: TextStyle(color: amountColor, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}