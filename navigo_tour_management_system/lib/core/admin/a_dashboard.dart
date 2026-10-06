import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Admin Overview',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 18),

                // Statistics
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        value: '550',
                        title: 'Total Passengers',
                        icon: Icons.people_outline,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        value: '₹45.2k',
                        title: 'Total Revenue',
                        icon: Icons.currency_rupee,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Active Trips
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Manage Active Trips',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Goa
                _buildTripCard(
                  image: 'assets/images/Goa_tour.jpg',
                  title: 'GOA Tour',
                  date: 'Oct 12 - Oct 18, 2026',
                  status: 'CONFIRMED',
                  seats: '14/20 seats',
                  statusColor: Colors.green,
                ),

                const SizedBox(height: 14),

                // Spiti Valley
                _buildTripCard(
                  image: 'assets/images/spiti valley.jpg',
                  title: 'Spiti Valley',
                  date: 'Nov 05 - Nov 12, 2026',
                  status: 'ON TOUR',
                  seats: '18/18 seats',
                  statusColor: Colors.orange,
                ),

                const SizedBox(height: 14),

                // Ooty
                // _buildTripCard(
                //   image: 'assets/images/ooty.jpg',
                //   title: 'Ooty',
                //   date: 'Dec 01 - Dec 10, 2026',
                //   status: 'IN PROGRESS',
                //   seats: '08/12 seats',
                //   statusColor: Colors.blue,
                // ),
              ],
            ),
          ),
        ),
      ),

      // ============================================================
      // ADD TRIP CIRCLE BUTTON
      // ============================================================

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add Trip action will be connected later.
        },
        backgroundColor: const Color(0xFF2626E8),
        elevation: 3,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String title,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE1E5F0),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: const Color(0xFF4A6CF7),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripCard({
    required String image,
    required String title,
    required String date,
    required String status,
    required String seats,
    required Color statusColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trip Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 145,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 7,
                            color: statusColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    Text(
                      seats,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}