
import 'package:flutter/material.dart';

class ATransactionHistory extends StatelessWidget {
  const ATransactionHistory({super.key});

  static const Color primaryBlue = Color(0xFF0056D2);

  final List<Map<String, dynamic>> transactions = const [
    {
      'name': 'Arjun Malhotra',
      'date': 'Oct 24, 10:45 AM',
      'description': 'Trip Payment',
      'amount': 3000,
      'status': 'SUCCESS',
    },
    {
      'name': 'Rahul Sharma',
      'date': 'Oct 23, 02:30 PM',
      'description': 'Passenger Refund',
      'amount': -1500,
      'status': 'REFUNDED',
    },
    {
      'name': 'Heet Tala',
      'date': 'Oct 22, 11:15 AM',
      'description': 'Trip Payment',
      'amount': 3500,
      'status': 'SUCCESS',
    },
    {
      'name': 'Kavya Patel',
      'date': 'Oct 21, 09:20 AM',
      'description': 'Trip Payment',
      'amount': 2500,
      'status': 'SUCCESS',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFDCE6FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Net Income',
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 5),
                Text(
                  '₹4.2L',
                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _FinancialItem(
                        title: 'Received',
                        amount: '₹4.5L',
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: _FinancialItem(
                        title: 'Refunded',
                        amount: '₹30K',
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...transactions.map((transaction) {
            final int amount = transaction['amount'] as int;
            final bool isRefund = amount < 0;

            return Card(
              color: Colors.white,
              elevation: 1,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: isRefund
                          ? const Color(0xFFFFE5E5)
                          : const Color(0xFFE5F6E9),
                      child: Icon(
                        isRefund
                            ? Icons.keyboard_return
                            : Icons.payments_outlined,
                        color: isRefund ? Colors.red : Colors.green,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction['name'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            transaction['description'] as String,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            transaction['date'] as String,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            transaction['status'] as String,
                            style: TextStyle(
                              color: isRefund ? Colors.red : Colors.green,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      '${isRefund ? '-' : '+'} ₹${amount.abs()}',
                      style: TextStyle(
                        color: isRefund ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _FinancialItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const _FinancialItem({
    required this.title,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          amount,
          style: TextStyle(
            color: color,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
