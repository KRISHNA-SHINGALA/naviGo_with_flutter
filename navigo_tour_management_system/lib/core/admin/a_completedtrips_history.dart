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
              Container(padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: BorderRadius.circular(12),
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'TOTAL REVENUE',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),

                      const Text(
                        '₹4.5L',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'COMPLETED',
                        style: TextStyle(
                          fontSize: 15,
                          color:Colors.blue.shade900,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5),

                      const Text(
                        '24',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'PASSENGERS',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '850',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),

            Row(mainAxisAlignment:
             MainAxisAlignment.spaceBetween,

             children: const[
              Text(
                'Recent Completion',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('2024 (current Year)',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              )
             ],
            ),
           const SizedBox(height:20),
            ],
          ),),
      )
    );
  }
}