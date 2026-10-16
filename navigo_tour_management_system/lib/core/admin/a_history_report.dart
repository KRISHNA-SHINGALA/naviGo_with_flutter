import 'package:flutter/material.dart';

class AdminHistoryReports extends StatefulWidget {
  const AdminHistoryReports({super.key});

  @override
  State<AdminHistoryReports> createState() =>
      _AdminHistoryReportsState();
}

class _AdminHistoryReportsState extends State<AdminHistoryReports> {
  static const Color primaryBlue = Color(0xFF0056D2);
  static const Color lightBlue = Color(0xFFDCE6FF);

  int _selectedTab = 0;

  final List<Map<String, dynamic>> _completedTrips = [
    {
      'title': 'Manali Winter Expedition',
      'date': 'Jan 10 - Jan 15, 2026',
      'passengers': '42 Passengers',
      'amount': '₹63,000',
    },
    {
      'title': 'Jaipur, Rajasthan',
      'date': 'Feb 17 - Feb 20, 2026',
      'passengers': '35 Passengers',
      'amount': '₹52,000',
    },
    {
      'title': 'Goa',
      'date': 'Mar 20 - Mar 26, 2026',
      'passengers': '58 Passengers',
      'amount': '₹87,000',
    },
  ];

  final List<Map<String, dynamic>> _transactions = [
    {
      'name': 'Arjun Malhotra',
      'tour': 'Rajasthan Heritage Tour',
      'date': 'Oct 24, 10:45 AM',
      'amount': '+ ₹3,000',
      'status': 'SUCCESS',
      'isRefund': false,
    },
    {
      'name': 'Arjun Malhotra',
      'tour': 'Rajasthan Heritage Tour',
      'date': 'Oct 24, 10:45 AM',
      'amount': '- ₹1,500',
      'status': 'REFUNDED',
      'isRefund': true,
    },
    {
      'name': 'Arjun Malhotra',
      'tour': 'Rajasthan Heritage Tour',
      'date': 'Oct 24, 10:45 AM',
      'amount': '+ ₹3,000',
      'status': 'SUCCESS',
      'isRefund': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // NaviGo application header.
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(
              Icons.route,
              color: primaryBlue,
              size: 27,
            ),
            SizedBox(width: 7),
            Text(
              'NaviGo',
              style: TextStyle(
                color: primaryBlue,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.person,
                color: Colors.black54,
                size: 20,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Display the selected history page.
            Expanded(
              child: _selectedTab == 0
                  ? _buildCompletedTripsPage()
                  : _buildTransactionsPage(),
            ),
          ],
        ),
      ),

      // Bottom navigation bar.
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // Build the History and Reports page for completed trips.
  Widget _buildCompletedTripsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'History & Reports',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 22),

          _buildHistoryTabs(),

          const SizedBox(height: 22),

          // Summary statistics.
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 17,
            ),
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: _SummaryItem(
                    label: 'TOTAL REVENUE',
                    value: '₹4.5L',
                  ),
                ),
                Expanded(
                  child: _SummaryItem(
                    label: 'COMPLETED',
                    value: '24',
                  ),
                ),
                Expanded(
                  child: _SummaryItem(
                    label: 'PASSENGERS',
                    value: '850',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Completed trips section heading.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Completions',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '2026 (Current Year)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Completed trip cards.
          ..._completedTrips.map(
            (trip) => _buildCompletedTripCard(trip),
          ),
        ],
      ),
    );
  }

  // Build the Transactions page.
  Widget _buildTransactionsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'History & Reports',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 22),

          _buildHistoryTabs(),

          const SizedBox(height: 16),

          // Financial summary card.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: lightBlue,
              border: Border.all(
                color: const Color(0xFF1594FF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Financial Summary',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Net Income',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '₹4.2L',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                const Row(
                  children: [
                    Expanded(
                      child: _SummaryItem(
                        label: 'Total Received',
                        value: '₹4.5L',
                        alignStart: true,
                      ),
                    ),
                    Expanded(
                      child: _SummaryItem(
                        label: 'Refunded',
                        value: '₹30K',
                        alignStart: true,
                        valueColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          // Individual transaction cards.
          ..._transactions.map(
            (transaction) => _buildTransactionCard(transaction),
          ),
        ],
      ),
    );
  }

  // Build the tabs used to switch between history pages.
  Widget _buildHistoryTabs() {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              title: 'Completed Trips',
              index: 0,
            ),
          ),
          Expanded(
            child: _buildTabButton(
              title: 'Transactions',
              index: 1,
            ),
          ),
        ],
      ),
    );
  }

  // Build an individual history tab button.
  Widget _buildTabButton({
    required String title,
    required int index,
  }) {
    final bool isSelected = _selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          maxLines: 1,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 11,
            fontWeight: isSelected
                ? FontWeight.w600
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Build a completed trip card.
  Widget _buildCompletedTripCard(Map<String, dynamic> trip) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  trip['title'] as String,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'COMPLETED',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 14,
                color: Colors.black54,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  trip['date'] as String,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              const Icon(
                Icons.people_outline,
                size: 14,
                color: Colors.black54,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  trip['passengers'] as String,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ),
              Text(
                trip['amount'] as String,
                style: const TextStyle(
                  fontSize: 12,
                  color: primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build an individual transaction card.
  Widget _buildTransactionCard(Map<String, dynamic> transaction) {
    final bool isRefund = transaction['isRefund'] as bool;
    final Color amountColor = isRefund ? Colors.red : Colors.green;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction['name'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transaction['tour'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Text(
                transaction['amount'] as String,
                style: TextStyle(
                  color: amountColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            transaction['date'] as String,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 10,
            ),
          ),

          const SizedBox(height: 5),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: amountColor.withAlpha(25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                transaction['status'] as String,
                style: TextStyle(
                  color: amountColor,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build the bottom navigation bar.
  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: Colors.white,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.black87,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (index) {
          // Return to the main application screen.
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${[
                    'Home',
                    'Tours',
                    'Saved',
                    'Passengers',
                    'Profile',
                  ][index]} navigation should be connected to AdminMainLayout.',
                ),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            label: 'Tours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Passengers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Reusable widget for displaying a summary value.
class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final bool alignStart;
  final Color? valueColor;

  const _SummaryItem({
    required this.label,
    required this.value,
    this.alignStart = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: alignStart ? TextAlign.start : TextAlign.center,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF0056D2),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: valueColor ?? const Color(0xFF172B4D),
          ),
        ),
      ],
    );
  }
}