
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/admin/admin_top_bar.dart';
import 'package:navigo_tour_management_system/core/admin/admin_bottom_bar.dart';

// ignore: camel_case_types
class A_HelpSupport extends StatefulWidget {
  const A_HelpSupport({super.key});

  @override
  State<A_HelpSupport> createState() => _A_HelpSupportState();
}

// ignore: camel_case_types
class _A_HelpSupportState extends State<A_HelpSupport> {
  static const Color primaryBlue = Color(0xFF0056D2);
  static const Color lightBlue = Color(0xFFDCE6FF);

  void _showSupportDialog(
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF444444),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Existing admin bottom navigation.
      bottomNavigationBar: const AdminBottomBar(
        currentIndex: 3,
      ),

      // Existing admin top navigation.
      body: SafeArea(
        child: Column(
          children: [
            const AdminTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  18,
                  16,
                  24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Page heading.
                    const Text(
                      'Help & Support',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF102A43),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Find help for managing your tours, '
                      'passengers and payments.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Support banner.
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              color: primaryBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.support_agent,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),

                          const SizedBox(height: 14),

                          const Text(
                            'How can we help you?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF102A43),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Get assistance with trip management, '
                            'passenger bookings and payment records.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Help categories.
                    const Text(
                      'Browse Help Topics',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF102A43),
                      ),
                    ),

                    const SizedBox(height: 14),

                    _buildHelpCard(
                      icon: Icons.map_outlined,
                      title: 'Trip Management',
                      subtitle:
                          'Create trips and manage trip details',
                      onTap: () {
                        _showSupportDialog(
                          'Trip Management',
                          'Open the trip management section '
                          'to create trips, update schedules, '
                          'manage pickup points and review '
                          'trip information.',
                        );
                      },
                    ),

                    _buildHelpCard(
                      icon: Icons.groups_outlined,
                      title: 'Passenger Management',
                      subtitle:
                          'View passenger details and bookings',
                      onTap: () {
                        _showSupportDialog(
                          'Passenger Management',
                          'Open the passenger section to review '
                          'passenger details and booking records. '
                          'Verify passenger information before '
                          'making any changes.',
                        );
                      },
                    ),

                    _buildHelpCard(
                      icon: Icons.payments_outlined,
                      title: 'Payments & Transactions',
                      subtitle:
                          'Payment status and transaction records',
                      onTap: () {
                        _showSupportDialog(
                          'Payments & Transactions',
                          'Review the transaction history and '
                          'payment status. Verify transaction '
                          'references before correcting a payment '
                          'record.',
                        );
                      },
                    ),

                    _buildHelpCard(
                      icon: Icons.event_busy_outlined,
                      title: 'Cancellation & Refunds',
                      subtitle:
                          'Cancellation requests and refund status',
                      onTap: () {
                        _showSupportDialog(
                          'Cancellation & Refunds',
                          'Review the trip cancellation policy '
                          'and passenger cancellation request. '
                          'Check refund eligibility and update '
                          'the record according to your business '
                          'rules.',
                        );
                      },
                    ),

                    const SizedBox(height: 26),

                    // Frequently asked questions.
                    const Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF102A43),
                      ),
                    ),

                    const SizedBox(height: 12),

                    _buildFaq(
                      question: 'How do I create a new trip?',
                      answer:
                          'Open the trip management section and '
                          'select Create New Trip. Enter the trip '
                          'name, dates, destination and other '
                          'required details before saving.',
                    ),

                    _buildFaq(
                      question:
                          'How can I check passenger payments?',
                      answer:
                          'Open the transaction or payment history '
                          'section to review available payment '
                          'records and payment statuses.',
                    ),

                    _buildFaq(
                      question:
                          'How do I handle a cancellation request?',
                      answer:
                          'Review the passenger booking and the '
                          'applicable cancellation policy before '
                          'approving or rejecting the request.',
                    ),

                    _buildFaq(
                      question:
                          'What if a payment record is incorrect?',
                      answer:
                          'Verify the original transaction details '
                          'and follow your payment correction '
                          'process. Keep a record of any correction '
                          'made.',
                    ),

                    _buildFaq(
                      question:
                          'How can I update my admin profile?',
                      answer:
                          'Open your Profile page and select '
                          'Edit Profile to update the available '
                          'personal information.',
                    ),

                    const SizedBox(height: 26),

                    // Contact support card.
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.headset_mic_outlined,
                            color: primaryBlue,
                            size: 42,
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Still need help?',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF102A43),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Contact the system support team '
                            'if you need further assistance.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            height: 46,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _showSupportDialog(
                                  'Contact Support',
                                  'Please contact your system '
                                  'administrator using the official '
                                  'support contact details provided '
                                  'by your organization.',
                                );
                              },
                              icon: const Icon(
                                Icons.support_agent,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Contact Support',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    Center(
                      child: Text(
                        'NaviGo Tour Management System',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Help category card.
  Widget _buildHelpCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: primaryBlue,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF102A43),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey.shade500,
        ),
        onTap: onTap,
      ),
    );
  }

  // Expandable FAQ item.
  Widget _buildFaq({
    required String question,
    required String answer,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          14,
          0,
          14,
          16,
        ),
        iconColor: primaryBlue,
        collapsedIconColor: Colors.grey.shade600,
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF102A43),
          ),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
