import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';

class AdminCreateTrip extends StatefulWidget {
  const AdminCreateTrip({super.key});

  @override
  State<AdminCreateTrip> createState() => _AdminCreateTripState();
}

class _AdminCreateTripState extends State<AdminCreateTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trip Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 16),

              _buildTextField(
                label: 'Trip Title',
                hint: 'e.g. Alpine Grand Tour 2024',
              ),

              const SizedBox(height: 10),

              _buildTextField(
                label: 'Origin City',
                hint: 'Starting point',
                icon: Icons.location_on_outlined,
              ),

              const SizedBox(height: 10),

              _buildTextField(
                label: 'Destination City',
                hint: 'Target destination',
                icon: Icons.location_on_outlined,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Start Date',
                      hint: 'mm/dd/yyyy',
                      icon: Icons.calendar_today_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      label: 'End Date',
                      hint: 'mm/dd/yyyy',
                      icon: Icons.calendar_today_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _buildTextField(
                label: 'Bus Type',
                hint: 'Luxury Coach',
                icon: Icons.directions_bus_outlined,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Total Seats',
                      hint: '0',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      label: 'Price per Seat',
                      hint: '₹0.00',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                'Trip Cover Preview',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'No photo selected',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_camera_outlined,
                    size: 17,
                  ),
                  label: const Text(
                    'Change Photo',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(
                      color: AppColors.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 42,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
              prefixIcon: icon == null
                  ? null
                  : Icon(
                      icon,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
              filled: true,
              fillColor: AppColors.searchBackground,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}