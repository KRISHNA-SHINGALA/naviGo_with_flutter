import 'package:flutter/material.dart';
//import 'package:navigo_tour_management_system/core/admin/a_activebooking&cancelreq.dart';
import 'package:navigo_tour_management_system/core/passenger/p_upcoming&past.dart';

// import 'package:navigo_tour_management_system/core/admin/a_dashboard.dart';
// import 'package:navigo_tour_management_system/core/passenger/p_dashboard.dart';
//import 'package:navigo_tour_management_system/core/passenger/p_tripsdetails.dart';
//import 'package:navigo_tour_management_system/core/passenger/p_booking.dart';
//import 'package:navigo_tour_management_system/core/passenger/p_payment.dart';
//import 'package:navigo_tour_management_system/core/admin/a_history&report.dart';
//import 'package:navigo_tour_management_system/core/auth/login_screen.dart';
// import 'package:navigo_tour_management_system/core/common/splash_screen.dart';

void main() {
  runApp(const NaviGoApp());
}

class NaviGoApp extends StatelessWidget {
  const NaviGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home:const MyTrips(), // Set the initial screen to LoginScreen
    );
  }
}
