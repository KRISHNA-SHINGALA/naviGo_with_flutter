
import 'package:flutter/material.dart';

class AdminCancelRequest extends StatefulWidget {
  const AdminCancelRequest({super.key});

  @override
  State<AdminCancelRequest> createState() => _AdminCancelRequestState();
}

class _AdminCancelRequestState extends State<AdminCancelRequest> {
  final Color primaryBlue = const Color(0xFF0056D2);

  final List<Map<String, dynamic>> requests = [
    {
      'id': 'NG1004',
      'name': 'Neha Shah',
      'trip': 'Rajkot to Udaipur',
      'date': '15 Oct 2026',
      'amount': 1800,
      'reason': 'Change in travel plan',
      'status': 'Pending',
    },
    {
      'id': 'NG1005',
      'name': 'Karan Mehta',
      'trip': 'Rajkot to Jaipur',
      'date': '18 Oct 2026',
      'amount': 2500,
      'reason': 'Personal reason',
      'status': 'Pending',
    },
    {
      'id': 'NG1006',
      'name': 'Pooja Patel',
      'trip': 'Ahmedabad to Nathdwara',
      'date': '10 Oct 2026',
      'amount': 1500,
      'reason': 'Trip no longer required',
      'status': 'Approved',
    },
  ];

  void updateRequest(int index, String status) {
    setState(() {
      requests[index]['status'] = status;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cancellation request $status'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pendingCount =
        requests.where((request) => request['status'] == 'Pending').length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
     
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange.withAlpha(30),
                  child: const Icon(
                    Icons.pending_actions,
                    color: Colors.orange,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pending Requests',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Review cancellation requests',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$pendingCount',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
                final status = request['status'] as String;
                final isPending = status == 'Pending';

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red.withAlpha(20),
                              child: const Icon(
                                Icons.person_outline,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    request['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Booking ID: ${request['id']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: (isPending
                                        ? Colors.orange
                                        : status == 'Approved'
                                            ? Colors.green
                                            : Colors.red)
                                    .withAlpha(25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: isPending
                                      ? Colors.orange
                                      : status == 'Approved'
                                          ? Colors.green
                                          : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        _info(Icons.directions_bus, request['trip']),
                        _info(Icons.calendar_today, request['date']),
                        _info(
                          Icons.currency_rupee,
                          'Booking Amount: ₹${request['amount']}',
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F7FB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cancellation Reason',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(request['reason']),
                            ],
                          ),
                        ),
                        if (isPending) ...[
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () =>
                                      updateRequest(index, 'Rejected'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                  child: const Text('Reject'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () =>
                                      updateRequest(index, 'Approved'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBlue,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Approve'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0056D2), size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
