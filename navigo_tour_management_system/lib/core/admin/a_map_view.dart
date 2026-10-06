import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';

class AdminMapView extends StatelessWidget {
  const AdminMapView({super.key});

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

              const SizedBox(height: 16),

              // ==================================================
              // MAP
              // ==================================================

              Container(
                width: double.infinity,

                height: 500,

                decoration: BoxDecoration(
                  color: AppColors.searchBackground,

                  borderRadius:
                      BorderRadius.circular(10),

                  border: Border.all(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),

                clipBehavior:
                    Clip.antiAlias,

                child: Image.asset(
                  'assets/images/Admin_map.png',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              // ==================================================
              // ROUTE ANALYSIS
              // ==================================================

              const Text(
                'ROUTE ANALYSIS',

                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Total Distance:',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              const Text(
                '882 km',

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 12),

              // ==================================================
              // INFORMATION BOXES
              // ==================================================

              Row(
                children: [

                  Expanded(
                    child: _buildInfoBox(
                      title: 'Estimated Time',
                      value: '15 Hours 22 min',
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _buildInfoBox(
                      title: 'Avg',
                      value: '56 km/h',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // ==================================================
              // PROCEED BUTTON
              // ==================================================

              SizedBox(
                width: double.infinity,

                height: 40,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary,

                    foregroundColor:
                        Colors.white,

                    elevation: 0,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8),
                    ),
                  ),

                  child: const Text(
                    'Proceed',

                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
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

  // ==============================================================
  // INFORMATION BOX
  // ==============================================================

  Widget _buildInfoBox({
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 9,
      ),

      decoration: BoxDecoration(
        color: AppColors.searchBackground,

        borderRadius:
            BorderRadius.circular(8),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            title,

            style: const TextStyle(
              fontSize: 9,
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,

            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}