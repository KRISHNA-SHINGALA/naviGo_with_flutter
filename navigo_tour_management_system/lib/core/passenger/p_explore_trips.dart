import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_bottom_bar.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_top_bar.dart';
import 'package:navigo_tour_management_system/resources/colors.dart';
import 'package:navigo_tour_management_system/resources/image.dart';

class PassengerExploreTrips extends StatefulWidget {
  const PassengerExploreTrips({super.key});

  @override
  State<PassengerExploreTrips> createState() =>
      _PassengerExploreTripsState();
}

class _PassengerExploreTripsState
    extends State<PassengerExploreTrips> {

  // 0 = All Trips
  // 1 = This Week
  // 2 = This Month
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: PreferredSize(
  preferredSize: const Size.fromHeight(60.0), 
  child: PassengerTopBar( // Yahan se 'const' hata diya hai
    onProfileTap: () {
      // Yahan aap profile page par navigate karne ka code likh sakte hain
      // Example: Navigator.push(...);
      print("Profile clicked!");
    },
  ),
),
bottomNavigationBar: const PassengerBottomBar(currentIndex: 0),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 14, 12, 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // ==================================================
                // PAGE TITLE
                // ==================================================

                const Text(
                  'Explore Trips',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // ==================================================
                // SEARCH FIELD
                // ==================================================

                SizedBox(
                  height: 34,

                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Search destinations, cities...',

                      hintStyle: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF7A8DB5),
                      ),

                      prefixIcon: const Icon(
                        Icons.search,
                        size: 17,
                        color: AppColors.primary,
                      ),

                      prefixIconConstraints:
                          const BoxConstraints(
                        minWidth: 35,
                      ),

                      filled: true,
                      fillColor:
                          const Color(0xFFDDE7FF),

                      contentPadding:
                          const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 8,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20),

                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20),

                        borderSide: BorderSide.none,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(20),

                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // ==================================================
                // FILTER TABS
                // ==================================================

                Row(
                  children: [

                    Expanded(
                      child: _buildFilterTab(
                        title: 'All Trips',
                        index: 0,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Expanded(
                      child: _buildFilterTab(
                        title: 'This Week',
                        index: 1,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Expanded(
                      child: _buildFilterTab(
                        title: 'This Month',
                        index: 2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // ==================================================
                // TRIPS
                // ==================================================

                _buildSelectedTrips(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // FILTER TAB
  // ==============================================================

  Widget _buildFilterTab({
    required String title,
    required int index,
  }) {
    final bool isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },

      child: Container(
        height: 25,

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : const Color(0xFFD5D5D5),

          borderRadius:
              BorderRadius.circular(15),
        ),

        alignment: Alignment.center,

        child: Text(
          title,

          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,

            color: isSelected
                ? Colors.white
                : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // SELECTED TRIPS
  // ==============================================================

  Widget _buildSelectedTrips() {

    // ALL TRIPS
    if (selectedTab == 0) {
      return Column(
        children: [

          _buildTripCard(
            image: AppImages.mahakaleshwar,
            title: 'Mahakaleshwar, Ujjain',
            rating: '4.9',
            date: '15 Oct - 20 Oct',
            vehicle: 'Premium AC Sleeper',
            seats: '15 Seats Available',
            seatsAvailable: true,
            price: '₹ 5000',
          ),

          const SizedBox(height: 12),

          _buildTripCard(
            image: AppImages.solangValley,
            title: 'Solang Valley, Manali',
            rating: '4.7',
            date: '22 Oct - 28 Oct',
            vehicle: 'Luxury Executive',
            seats: '2 Seats Available',
            seatsAvailable: false,
            price: '₹ 10,000',
          ),
        ],
      );
    }

    // THIS WEEK
    if (selectedTab == 1) {
      return _buildNoTripsMessage(
        'No trips available this week.',
      );
    }

    // THIS MONTH
    return Column(
      children: [

        _buildTripCard(
          image: AppImages.mahakaleshwar,
          title: 'Mahakaleshwar, Ujjain',
          rating: '4.9',
          date: '15 Oct - 20 Oct',
          vehicle: 'Premium AC Sleeper',
          seats: '15 Seats Available',
          seatsAvailable: true,
          price: '₹ 5000',
        ),

        const SizedBox(height: 12),

        _buildTripCard(
          image: AppImages.solangValley,
          title: 'Solang Valley, Manali',
          rating: '4.7',
          date: '22 Oct - 28 Oct',
          vehicle: 'Luxury Executive',
          seats: '2 Seats Available',
          seatsAvailable: false,
          price: '₹ 10,000',
        ),
      ],
    );
  }

  // ==============================================================
  // NO TRIPS MESSAGE
  // ==============================================================

  Widget _buildNoTripsMessage(String message) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),

      alignment: Alignment.center,

      child: Text(
        message,

        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF777777),
        ),
      ),
    );
  }

  // ==============================================================
  // TRIP CARD
  // ==============================================================

  Widget _buildTripCard({
    required String image,
    required String title,
    required String rating,
    required String date,
    required String vehicle,
    required String seats,
    required bool seatsAvailable,
    required String price,
  }) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(8),

        border: Border.all(
          color: const Color(0xFFD5D5D5),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ========================================================
          // TRIP IMAGE
          // ========================================================

          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(
              top: Radius.circular(8),
            ),

            child: Image.asset(
              image,

              width: double.infinity,

              height: 120,

              fit: BoxFit.cover,
            ),
          ),

          // ========================================================
          // TRIP INFORMATION
          // ========================================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              10,
              8,
              10,
              10,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                // --------------------------------------------------
                // TITLE + RATING
                // --------------------------------------------------

                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,

                  children: [

                    Expanded(
                      child: Text(
                        title,

                        maxLines: 1,

                        overflow:
                            TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 5),

                    const Icon(
                      Icons.star,
                      size: 10,
                      color: Color(0xFF777777),
                    ),

                    const SizedBox(width: 2),

                    Text(
                      rating,

                      style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF555555),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                // --------------------------------------------------
                // DATE + VEHICLE
                // --------------------------------------------------

                Row(
                  children: [

                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 10,
                      color: Color(0xFF555555),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      date,

                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xFF555555),
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.directions_bus_outlined,
                      size: 10,
                      color: Color(0xFF555555),
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        vehicle,

                        maxLines: 1,

                        overflow:
                            TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 8,
                          color: Color(0xFF555555),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                // --------------------------------------------------
                // SEAT STATUS
                // --------------------------------------------------

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),

                  decoration: BoxDecoration(
                    color: seatsAvailable
                        ? const Color(0xFFD8F7E5)
                        : const Color(0xFFFFDCDC),

                    borderRadius:
                        BorderRadius.circular(4),
                  ),

                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [

                      Icon(
                        Icons.circle,

                        size: 6,

                        color: seatsAvailable
                            ? const Color(0xFF19A55B)
                            : const Color(0xFFD83232),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        seats,

                        style: TextStyle(
                          fontSize: 8,

                          fontWeight:
                              FontWeight.w500,

                          color: seatsAvailable
                              ? const Color(0xFF15934F)
                              : const Color(0xFFD83232),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 7),

                // --------------------------------------------------
                // PRICE + VIEW DETAILS
                // --------------------------------------------------

                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,

                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          const Text(
                            'Starting at',

                            style: TextStyle(
                              fontSize: 8,
                              color: Color(0xFF666666),
                            ),
                          ),

                          const SizedBox(height: 1),

                          Text(
                            price,

                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight:
                                  FontWeight.w600,
                              color:
                                  AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // VIEW DETAILS BUTTON
                    SizedBox(
                      height: 31,

                      child: ElevatedButton(
                        onPressed: () {
                          // View Details action
                          // will be connected later.
                        },

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primary,

                          foregroundColor:
                              Colors.white,

                          elevation: 0,

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              18,
                            ),
                          ),
                        ),

                        child: const Text(
                          'View Details',

                          style: TextStyle(
                            fontSize: 9,
                            fontWeight:
                                FontWeight.w500,
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
}