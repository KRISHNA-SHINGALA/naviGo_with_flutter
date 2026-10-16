
import 'package:flutter/material.dart';

class AdminCompletedTrips extends StatelessWidget {
  const AdminCompletedTrips({super.key});

  static const Color primaryBlue = Color(0xFF0056D2);

  final List<Map<String, String>> trips = const [
    {
      'title': 'Manali Winter Expedition',
      'date': 'Jan 10 - Jan 15, 2026',
      'passengers': '42 Passengers',
      'revenue': '₹63,000',
    },
    {
      'title': 'Jaipur Heritage Tour',
      'date': 'Feb 17 - Feb 20, 2026',
      'passengers': '35 Passengers',
      'revenue': '₹52,000',
    },
    {
      'title': 'Goa Beach Tour',
      'date': 'Mar 20 - Mar 26, 2026',
      'passengers': '58 Passengers',
      'revenue': '₹87,000',
    },
    {
      'title': 'Ujjain Temple Tour',
      'date': 'Apr 05 - Apr 08, 2026',
      'passengers': '40 Passengers',
      'revenue': '₹60,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Completed Trips',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Display the completed trips summary.
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFDCE6FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Completed Trips'),
                      SizedBox(height: 8),
                      Text(
                        '24',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: primaryBlue,
                  size: 40,
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'Trip History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Display all completed trip cards.
          ...trips.map(
            (trip) => Card(
              color: Colors.white,
              elevation: 1,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.directions_bus_outlined,
                          color: primaryBlue,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            trip['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    _detailRow(
                      Icons.calendar_month_outlined,
                      trip['date']!,
                    ),

                    const SizedBox(height: 8),

                    _detailRow(
                      Icons.people_outline,
                      trip['passengers']!,
                    ),

                    const Divider(height: 24),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trip Revenue',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          trip['revenue']!,
                          style: const TextStyle(
                            color: primaryBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: Chip(
                        label: Text(
                          'COMPLETED',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xFFE5F6E9),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a row for displaying trip information.
  Widget _detailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
