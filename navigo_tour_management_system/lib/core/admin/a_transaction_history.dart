import 'package:flutter/material.dart';

class ATransactionHistory extends StatefulWidget {
  const ATransactionHistory({super.key});

  @override
  State<ATransactionHistory> createState() => _ATransactionHistoryState();
}

class _ATransactionHistoryState extends State<ATransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child:Padding(
          padding:const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 159, 174, 248),
                  borderRadius: BorderRadius.circular(15)
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                    'Financial Summary',
                    style: TextStyle(
                    color: Color.fromARGB(255, 7, 3, 51),
                    fontSize: 15,
                    ),
                   ),
                   Row(
                    children: [
                      const Text(
                        'Net Income ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 79, 78, 78),
                          fontSize:20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '₹4.2L',
                        style: TextStyle(
                         color: Color.fromARGB(255, 2, 2, 84),
                         fontSize: 25,
                         fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                   ),
                   const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Recevied',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 52, 52, 52),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Refunded',
                            style: TextStyle(
                            fontSize: 15,
                            color:  Color.fromARGB(255, 52, 52, 52),
                            ),
                          ),
                        ],
                      )
                    ],
                   ),
                   const SizedBox(height:20),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '₹4.5L',
                          style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '₹30K',
                          style: TextStyle(
                            color: Color.fromARGB(255, 170, 17, 6),
                            fontWeight: FontWeight.bold
                          ),
                        ) 
                      ],
                    )
                    ],
                   )
                  ],
                ),
              )
            ],
          ),
        ) ,
      )

    );
  }
}