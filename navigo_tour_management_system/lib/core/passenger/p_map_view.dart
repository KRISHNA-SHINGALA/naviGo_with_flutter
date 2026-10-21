import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/p_booking.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';

class PassengerMapView extends StatelessWidget {
  const PassengerMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
    
      bottomNavigationBar: const PassengerBottomBar(currentIndex: 1), // Index 1 for Tours/Details
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(
                width: double.infinity, height: 500,
                decoration: BoxDecoration(color: AppColors.searchBackground, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.border, width: 1)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/images/Admin_map.png', fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              const Text('ROUTE ANALYSIS', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: AppColors.textSecondary)),
              const SizedBox(height: 4),
              const Text('Total Distance:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const Text('420 km', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primary)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildInfoBox(title: 'Estimated Time', value: '8 Hours')),
                  const SizedBox(width: 10),
                  Expanded(child: _buildInfoBox(title: 'Avg', value: '56 km/h')),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity, height: 40,
                child: ElevatedButton(
                  onPressed: () {
                          Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const Booking(),
    ),
  );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back, size: 16),
                      SizedBox(width: 8),
                      Text('Back to booking', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                    ],
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

  Widget _buildInfoBox({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(color: AppColors.searchBackground, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
          const SizedBox(height: 3),
          Text(value, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}