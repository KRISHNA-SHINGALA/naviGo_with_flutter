
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';

class P_HelpSupportPage extends StatelessWidget {
  const P_HelpSupportPage({super.key});

  static const Color primaryBlue = Color(0xFF0056D2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Keep the passenger bottom navigation bar visible.
      bottomNavigationBar: const PassengerBottomBar(currentIndex: 3),

      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Help & Support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome banner.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: primaryBlue,
                      child: Icon(
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
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Find answers to your questions about trips, '
                      'bookings and payments.',
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

              const Text(
                'How can we assist you?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              // Help categories.
              _buildHelpCard(
                context,
                icon: Icons.confirmation_number_outlined,
                title: 'Booking Issues',
                subtitle: 'Booking confirmation and trip details',
                onTap: () => _showInfoDialog(
                  context,
                  'Booking Issues',
                  'Open My Bookings to check your booking status '
                  'and available trip details. If your booking '
                  'is missing, contact the trip administrator.',
                ),
              ),

              _buildHelpCard(
                context,
                icon: Icons.payment_outlined,
                title: 'Payment Issues',
                subtitle: 'Payment status and payment confirmation',
                onTap: () => _showInfoDialog(
                  context,
                  'Payment Issues',
                  'Check your payment status in your booking details. '
                  'If money has been deducted but payment is pending, '
                  'keep your transaction reference and contact '
                  'the trip administrator.',
                ),
              ),

              _buildHelpCard(
                context,
                icon: Icons.event_busy_outlined,
                title: 'Cancellation & Refund',
                subtitle: 'Trip cancellation and refund information',
                onTap: () => _showInfoDialog(
                  context,
                  'Cancellation & Refund',
                  'Check your trip cancellation policy before '
                  'requesting cancellation. Refund eligibility and '
                  'processing time depend on the applicable trip policy.',
                ),
              ),

              _buildHelpCard(
                context,
                icon: Icons.person_outline,
                title: 'Account Issues',
                subtitle: 'Profile and account-related assistance',
                onTap: () => _showInfoDialog(
                  context,
                  'Account Issues',
                  'Open Edit Profile to review your personal details. '
                  'For login or account access problems, contact '
                  'the trip administrator.',
                ),
              ),

              const SizedBox(height: 26),

              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _buildFaq(
                'How can I check my booking?',
                'Open the My Bookings section from your profile '
                'to view your booking information and status.',
              ),

              _buildFaq(
                'How do I confirm my payment?',
                'Check your booking payment status. If it is still '
                'pending after payment, contact the trip administrator '
                'with your transaction reference.',
              ),

              _buildFaq(
                'Can I cancel my trip?',
                'Cancellation depends on the trip policy and '
                'applicable cancellation deadline. Check your booking '
                'details before requesting cancellation.',
              ),

              _buildFaq(
                'How can I update my profile?',
                'Go to Profile and tap Edit Profile to update '
                'the details available for editing.',
              ),

              const SizedBox(height: 26),

              // Contact support section.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
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
                      size: 38,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Still need help?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Contact your trip administrator for '
                      'booking, payment or account assistance.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showInfoDialog(
                            context,
                            'Contact Support',
                            'Please contact your trip administrator '
                            'using the contact details provided '
                            'with your trip booking.',
                          );
                        },
                        icon: const Icon(Icons.support_agent),
                        label: const Text('Contact Support'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: Text(
                  'Navigo Tour Management System',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // Build a help category card.
  Widget _buildHelpCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: primaryBlue,
            size: 25,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
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

  // Build an expandable FAQ item.
  Widget _buildFaq(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 14),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
        iconColor: primaryBlue,
        collapsedIconColor: Colors.grey,
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Show information in a dialog.
  void _showInfoDialog(
    BuildContext context,
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
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              height: 1.5,
              fontSize: 14,
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
}