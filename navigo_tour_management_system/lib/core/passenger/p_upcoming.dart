import 'package:flutter/material.dart';

class PUpcoming extends StatefulWidget {
  const PUpcoming({super.key});

  @override
  State<PUpcoming> createState() => _PUpcomingState();
}

class _PUpcomingState extends State<PUpcoming> {
  // Static List Data
  final List<Map<String, String>> trips = [
    {
      'title': 'Swiss Alpine Express',
      'date': 'Dec 05 - Dec 12, 2025',
      'status': 'Confirmed',
      'imagePath': 'assets/images/express.jpg',
    },
    {
      'title': 'Amalfi Coast Expedition',
      'date': 'Oct 12 - Oct 18, 2024',
      'status': 'Confirmed',
      'imagePath': 'assets/images/Amalfi Coast Expedition.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ASSET IMAGE WIDGET
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.asset(
                      trip['imagePath']!,
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,

                      errorBuilder:
                          (context, error, stackTrace) {
                        return Container(
                          height: 90,
                          width: 90,
                          color: Colors.grey.shade200,

                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Confirmed Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(
                          width: 8,
                          height: 8,

                          decoration:
                              const BoxDecoration(
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

                  // Title
                  Text(
                    trip['title']!,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Date
                  Text(
                    trip['date']!,

                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // View Ticket Button
                  SizedBox(
                    width: double.infinity,

                    child: OutlinedButton(
                      onPressed: () {
                        // View Ticket
                      },

                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8),
                        ),

                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      ),

                      child: const Text(
                        'View Ticket',

                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}