
import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/p_booking.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_top_bar.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';
import 'package:navigo_tour_management_system/resources/strings.dart';
import 'passenger_profile_screen.dart';

class AppImages {
  static const String mahakaleshwar = 'assets/images/mahakaleshwar.jpg';
  static const String solangValley = 'assets/images/solang_valley.jpg';
  static const String jaswantThada = 'assets/images/jaswant_thada.jpg';
}

class PassDashboard extends StatefulWidget {
  const PassDashboard({super.key});

  @override
  State<PassDashboard> createState() => _PassDashboardState();
}

class _PassDashboardState extends State<PassDashboard> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final tours = [
      {
        'image': AppImages.mahakaleshwar,
        'title': AppStrings.mahakaleshwar,
        'duration': AppStrings.fourDays,
        'description': AppStrings.mahakaleshwarDescription,
        'price': AppStrings.mahakaleshwarPrice,
      },
      {
        'image': AppImages.solangValley,
        'title': AppStrings.solangValley,
        'duration': AppStrings.sevenDays,
        'description': AppStrings.solangValleyDescription,
        'price': AppStrings.solangValleyPrice,
      },
    ].where((tour) =>
        '${tour['title']} ${tour['description']}'
            .toLowerCase()
            .contains(searchQuery.toLowerCase())).toList();

    final destinations = [
      {
        'image': AppImages.mahakaleshwar,
        'title': AppStrings.mahakaleshwar,
        'description': AppStrings.mahakaleshwarPopularDescription,
      },
      {
        'image': AppImages.solangValley,
        'title': AppStrings.solangValley,
        'description': AppStrings.solangValleyPopularDescription,
      },
      {
        'image': AppImages.jaswantThada,
        'title': AppStrings.jaswantThada,
        'description': AppStrings.jaswantThadaDescription,
      },
    ].where((destination) =>
        '${destination['title']} ${destination['description']}'
            .toLowerCase()
            .contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          bottom: false,
          child: PassengerTopBar(
            onProfileTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PassengerProfileScreen(),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const PassengerBottomBar(currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 42,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: AppStrings.searchDestination,
                    hintStyle: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
                    prefixIcon: const Icon(Icons.search, size: 21, color: AppColors.textSecondary),
                    filled: true,
                    fillColor: AppColors.searchBackground,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(AppStrings.upcomingTours, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                ],
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: tours.isEmpty
                  ? const Center(child: Text('No matching tours found'))
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        for (final tour in tours) ...[
                          _buildTourCard(
                            image: tour['image']!,
                            title: tour['title']!,
                            duration: tour['duration']!,
                            description: tour['description']!,
                            price: tour['price']!,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ],
                    ),
            ),

            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppStrings.popularDestinations, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const PassengerExploreTrips(),
                  //       ),
                  //     );
                  //   },
                  //   // child: Text(
                  //   //   AppStrings.viewAll,
                  //   //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary),
                  //   // ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            if (destinations.isEmpty)
              const Padding(
                padding: EdgeInsets.all(18),
                child: Center(child: Text('No matching destinations found')),
              )
            else
              for (final destination in destinations) ...[
                _buildDestinationCard(
                  image: destination['image']!,
                  title: destination['title']!,
                  description: destination['description']!,
                ),
                const SizedBox(height: 9),
              ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTourCard({
    required String image,
    required String title,
    required String duration,
    required String description,
    required String price,
  }) {
    return Container(
      width: 230,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFD5D5D5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(10)), child: Image.asset(image, width: double.infinity, height: 105, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                const SizedBox(height: 5),
                Row(children: [const Icon(Icons.calendar_today_outlined, size: 12, color: AppColors.textSecondary), const SizedBox(width: 4), Text(duration, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary))]),
                const SizedBox(height: 5),
                Text(description, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Booking(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 18), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                        child: const Text('Book', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
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

  Widget _buildDestinationCard({required String image, required String title, required String description}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 82,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9), border: Border.all(color: const Color(0xFFD4D4D4))),
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.all(6), child: ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.asset(image, width: 68, height: 68, fit: BoxFit.cover))),
          Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(6, 8, 8, 8), child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)), const SizedBox(height: 4), Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, height: 1.25, color: AppColors.textSecondary))]))),
        ],
      ),
    );
  }
}
