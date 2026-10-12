
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';
import 'package:navigo_tour_management_system/resources/image.dart';

import 'package:navigo_tour_management_system/core/passenger/p_booking.dart';
import 'package:navigo_tour_management_system/core/passenger/p_explore_trips.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_profile_screen.dart';

class PassDashboard extends StatefulWidget {
  const PassDashboard({super.key});

  @override
  State<PassDashboard> createState() => _PassDashboardState();
}

class _PassDashboardState extends State<PassDashboard> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, String>> _destinations = [
    {
      'image': AppImages.mahakaleshwar,
      'title': 'Mahakaleshwar, Ujjain',
      'description':
          'a famous Hindu shrine, the only south-facing Jyotirl...',
    },
    {
      'image': AppImages.solangValley,
      'title': 'Solang Valley, Manali',
      'description':
          'a famous adventure and nature destination located...',
    },
    {
      'image': AppImages.jaswantThada,
      'title': 'Jaswant Thada, Rajasthan',
      'description':
          'a stunning white marble cenotaph built in 1899 by...',
    },
  ];

  List<Map<String, String>> get _filteredDestinations {
    final query = _searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return _destinations;
    }

    return _destinations.where((destination) {
      final title = destination['title']!.toLowerCase();
      final description = destination['description']!.toLowerCase();

      return title.contains(query) || description.contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openExploreTrips() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PassengerExploreTrips(),
      ),
    );
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PassengerProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // Existing passenger bottom navigation bar.
      bottomNavigationBar: const PassengerBottomBar(
        currentIndex: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome text and profile icon.
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Hello, Krisha!',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: _openProfile,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 19,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Search field.
              Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 17,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        onSubmitted: (_) => _openExploreTrips(),
                        decoration: const InputDecoration(
                          hintText: 'Where do you want to go?',
                          hintStyle: TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textPrimary,
                        ),
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                    if (_searchQuery.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Upcoming tours heading.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Tours',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: _openExploreTrips,
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Upcoming tour cards.
              SizedBox(
                height: 180,
                child: Row(
                  children: [
                    Expanded(
                      child: _buildUpcomingTour(
                        image: AppImages.mahakaleshwar,
                        title: 'Mahakaleshwar, Ujjain',
                        days: '4 days',
                        description: 'Private tour & villa stay.',
                        price: '₹ 5000',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildUpcomingTour(
                        image: AppImages.solangValley,
                        title: 'Solang Valley, Manali',
                        days: '7 Days',
                        description: 'All-Terrain Vehicle (ATV)',
                        price: '₹ 10000',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'Popular Destinations',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 10),

              if (_filteredDestinations.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'No destinations found.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                )
              else
                ..._filteredDestinations.map((destination) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: _openExploreTrips,
                      child: _buildPopularDestination(
                        image: destination['image']!,
                        title: destination['title']!,
                        description: destination['description']!,
                      ),
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingTour({
    required String image,
    required String title,
    required String days,
    required String description,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 86,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    days,
                    style: const TextStyle(
                      fontSize: 8,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Booking(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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

  Widget _buildPopularDestination({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 58,
              height: 52,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chevron_right,
              size: 15,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
