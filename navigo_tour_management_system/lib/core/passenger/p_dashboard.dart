import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';
import 'package:navigo_tour_management_system/resources/image.dart';
// import 'package:navigo_tour_management_system/resources/images.dart';
import 'package:navigo_tour_management_system/resources/strings.dart';

class PassDashboard extends StatefulWidget {
  const PassDashboard({super.key});

  @override
  State<PassDashboard> createState() => _PassDashboardState();
}

class _PassDashboardState extends State<PassDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ============================
              // WELCOME
              // ============================

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      AppStrings.welcomeBack,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      AppStrings.helloKrisha,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              // ============================
              // SEARCH
              // ============================

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 42,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppStrings.searchDestination,

                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),

                      prefixIcon: const Icon(
                        Icons.search,
                        size: 21,
                        color: AppColors.textSecondary,
                      ),

                      filled: true,
                      fillColor: AppColors.searchBackground,

                      contentPadding: EdgeInsets.zero,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              // ============================
              // UPCOMING TOURS
              // ============================

              const SizedBox(height: 19),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      AppStrings.upcomingTours,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    Text(
                      AppStrings.viewAll,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ============================
              // TOUR CARDS
              // ============================

              SizedBox(
                height: 220,

                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),

                  children: [

                    _buildTourCard(
                      image: AppImages.mahakaleshwar,
                      title: AppStrings.mahakaleshwar,
                      duration: AppStrings.fourDays,
                      description:
                          AppStrings.mahakaleshwarDescription,
                      price: AppStrings.mahakaleshwarPrice,
                    ),

                    const SizedBox(width: 10),

                    _buildTourCard(
                      image: AppImages.solangValley,
                      title: AppStrings.solangValley,
                      duration: AppStrings.sevenDays,
                      description:
                          AppStrings.solangValleyDescription,
                      price: AppStrings.solangValleyPrice,
                    ),
                  ],
                ),
              ),

              // ============================
              // POPULAR DESTINATIONS
              // ============================

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      AppStrings.popularDestinations,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    Text(
                      AppStrings.viewAll,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ============================
              // DESTINATION 1
              // ============================

              _buildDestinationCard(
                image: AppImages.mahakaleshwar,
                title: AppStrings.mahakaleshwar,
                description:
                    AppStrings.mahakaleshwarPopularDescription,
              ),

              const SizedBox(height: 9),

              // ============================
              // DESTINATION 2
              // ============================

              _buildDestinationCard(
                image: AppImages.solangValley,
                title: AppStrings.solangValley,
                description:
                    AppStrings.solangValleyPopularDescription,
              ),

              const SizedBox(height: 9),

              // ============================
              // DESTINATION 3
              // ============================

              _buildDestinationCard(
                image: AppImages.jaswantThada,
                title: AppStrings.jaswantThada,
                description:
                    AppStrings.jaswantThadaDescription,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // UPCOMING TOUR CARD
  // ============================================================

  Widget _buildTourCard({
    required String image,
    required String title,
    required String duration,
    required String description,
    required String price,
  }) {
    return Container(
      width: 230,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: const Color(0xFFD5D5D5),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),

            child: Image.asset(
              image,
              width: double.infinity,
              height: 105,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              9,
              6,
              9,
              6,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [

                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  price,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // POPULAR DESTINATION CARD
  // ============================================================

  Widget _buildDestinationCard({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),

      height: 82,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(9),

        border: Border.all(
          color: const Color(0xFFD4D4D4),
        ),
      ),

      child: Row(
        children: [

          // Image
          Padding(
            padding: const EdgeInsets.all(6),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),

              child: Image.asset(
                image,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                6,
                8,
                8,
                8,
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 10,
                      height: 1.25,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}