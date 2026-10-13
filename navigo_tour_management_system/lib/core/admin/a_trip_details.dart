
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';
import 'package:navigo_tour_management_system/resources/image.dart';
import 'package:navigo_tour_management_system/core/admin/a_map_view.dart';
import 'package:navigo_tour_management_system/core/admin/a_create_trip.dart';

class AdminTripDetails extends StatelessWidget {
  const AdminTripDetails({super.key});

  void _showPassengerDetails(
    BuildContext context, {
    required String name,
    required String phone,
    required String seat,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone: $phone'),
            const SizedBox(height: 8),
            Text('Seat: $seat'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmCancelTrip(BuildContext context) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cancel Trip?'),
        content: const Text(
          'Are you sure you want to cancel this trip? '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Keep Trip'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Cancel Trip'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Trip cancellation confirmed. Connect your database '
          'to save this change permanently.',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 40, 12, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppImages.mahakaleshwar,
                  width: double.infinity,
                  height: 195,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  'Mahakaleshwar Temple,\nUjjain',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 11,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Oct 12 - Oct 18, 2026',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 28,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdminMapView(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.map_outlined, size: 13),
                  label: const Text(
                    'View Route',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Booked Passenger',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '24/40',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              _buildPassengerCard(
                context,
                name: 'Vihaan',
                phone: '1234567890',
                seat: 'Seat 12',
              ),

              const SizedBox(height: 8),

              _buildPassengerCard(
                context,
                name: 'Kavya',
                phone: '1234567890',
                seat: 'Seat 08',
              ),

              const SizedBox(height: 8),

              _buildPassengerCard(
                context,
                name: 'Yaksh',
                phone: '1234567890',
                seat: 'Seat 21',
              ),

              const SizedBox(height: 8),

              _buildPassengerCard(
                context,
                name: 'Jency',
                phone: '1234567890',
                seat: 'Seat 04',
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 28,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdminCreateTrip(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_outlined, size: 12),
                  label: const Text(
                    'Edit Trip',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                height: 28,
                child: OutlinedButton.icon(
                  onPressed: () => _confirmCancelTrip(context),
                  icon: const Icon(Icons.cancel_outlined, size: 12),
                  label: const Text(
                    'Cancel Trip',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPassengerCard(
    BuildContext context, {
    required String name,
    required String phone,
    required String seat,
  }) {
    return InkWell(
      onTap: () {
        _showPassengerDetails(
          context,
          name: name,
          phone: phone,
          seat: seat,
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: AppColors.searchBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 14,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 8,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                seat,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
