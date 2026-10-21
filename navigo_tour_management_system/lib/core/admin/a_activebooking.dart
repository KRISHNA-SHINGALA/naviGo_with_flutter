
import 'package:flutter/material.dart';

class AdminActiveBooking extends StatefulWidget {
  const AdminActiveBooking({super.key});

  @override
  State<AdminActiveBooking> createState() => _AdminActiveBookingState();
}

class _AdminActiveBookingState extends State<AdminActiveBooking> {
  final Color primaryBlue = const Color(0xFF0056D2);
  final TextEditingController searchController = TextEditingController();

  String selectedStatus = 'All';

  final List<Map<String, dynamic>> bookings = [
    {
      'id': 'NG1001',
      'name': 'Rahul Sharma',
      'phone': '9876543210',
      'trip': 'Rajkot to Udaipur',
      'date': '20 Oct 2026',
      'pickup': 'Rajkot Bus Stand',
      'amount': 1800,
      'payment': 'Paid',
      'status': 'Confirmed',
    },
    {
      'id': 'NG1002',
      'name': 'Priya Patel',
      'phone': '9876512345',
      'trip': 'Rajkot to Jaipur',
      'date': '22 Oct 2026',
      'pickup': 'Gondal Chowk',
      'amount': 2500,
      'payment': 'Pending',
      'status': 'Pending',
    },
    {
      'id': 'NG1003',
      'name': 'Amit Verma',
      'phone': '9123456780',
      'trip': 'Ahmedabad to Nathdwara',
      'date': '25 Oct 2026',
      'pickup': 'Ahmedabad Bus Stand',
      'amount': 1500,
      'payment': 'Paid',
      'status': 'Confirmed',
    },
  ];

  List<Map<String, dynamic>> get filteredBookings {
    final query = searchController.text.toLowerCase().trim();

    return bookings.where((booking) {
      final matchesSearch =
          booking['name'].toString().toLowerCase().contains(query) ||
          booking['id'].toString().toLowerCase().contains(query) ||
          booking['trip'].toString().toLowerCase().contains(query);

      final matchesStatus = selectedStatus == 'All' ||
          booking['status'] == selectedStatus;

      return matchesSearch && matchesStatus;
    }).toList();
  }

  Color statusColor(String status) {
    if (status == 'Confirmed') return Colors.green;
    if (status == 'Pending') return Colors.orange;
    return Colors.red;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = filteredBookings;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search passenger, booking ID or trip',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: ['All', 'Confirmed', 'Pending'].map((status) {
                final selected = selectedStatus == status;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(status),
                    selected: selected,
                    selectedColor: primaryBlue,
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black87,
                    ),
                    onSelected: (_) {
                      setState(() => selectedStatus = status);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                const Text(
                  'Booking Records',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text('${items.length} bookings'),
              ],
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? const Center(child: Text('No bookings found'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final booking = items[index];
                      final status = booking['status'] as String;

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
                                    backgroundColor:
                                        primaryBlue.withAlpha(25),
                                    child: Icon(
                                      Icons.person,
                                      color: primaryBlue,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          booking['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'Booking ID: ${booking['id']}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    status,
                                    style: TextStyle(
                                      color: statusColor(status),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 24),
                              _detailRow(
                                Icons.directions_bus,
                                booking['trip'],
                              ),
                              _detailRow(
                                Icons.calendar_today,
                                booking['date'],
                              ),
                              _detailRow(
                                Icons.location_on_outlined,
                                booking['pickup'],
                              ),
                              _detailRow(
                                Icons.phone_outlined,
                                booking['phone'],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    '₹${booking['amount']}',
                                    style: TextStyle(
                                      color: primaryBlue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Payment: ${booking['payment']}',
                                    style: TextStyle(
                                      color: booking['payment'] == 'Paid'
                                          ? Colors.green
                                          : Colors.orange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return AlertDialog(
                                          title: const Text('Booking Details'),
                                          content: Text(
                                            'Booking ID: ${booking['id']}\n'
                                            'Passenger: ${booking['name']}\n'
                                            'Phone: ${booking['phone']}\n'
                                            'Trip: ${booking['trip']}\n'
                                            'Date: ${booking['date']}\n'
                                            'Pickup: ${booking['pickup']}\n'
                                            'Amount: ₹${booking['amount']}\n'
                                            'Payment: ${booking['payment']}\n'
                                            'Status: ${booking['status']}',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(dialogContext),
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('View Details'),
                                ),
                              ),
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

  Widget _detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0056D2), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF526477)),
            ),
          ),
        ],
      ),
    );
  }
}
