import 'package:flutter/material.dart';

class ACompletedtripsHistory extends StatefulWidget {
  const ACompletedtripsHistory({super.key});

  @override
  State<ACompletedtripsHistory> createState() => _ACompletedtripsHistoryState();
}

class _ACompletedtripsHistoryState extends State<ACompletedtripsHistory> {
  final topics =[
    {
      'Place':'Manali Winter Expedition',
      'Date':'Jan 10 - Jan 15, 2026',
      'Passengers':'42 Passengers',
      'Price':'₹63,000'
    },
    {
      'Place':'Jaipur, Rajasthan',
      'Date':'feb 17 - feb 20, 2026',
      'Passengers':'35 Passengers',
      'Price':'₹52,000'
    },
    {
      'Place':'Goa',
      'Date':'mar 20 - mar 26, 2026',
      'Passengers':'58 Passengers',
      'Price':'₹82,000'
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),),
      )
    );
  }
}