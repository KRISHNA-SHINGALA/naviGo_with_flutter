import 'package:flutter/material.dart';

class ATransactionHistory extends StatefulWidget {
  const ATransactionHistory({super.key});

  @override
  State<ATransactionHistory> createState() => _ATransactionHistoryState();
}

class _ATransactionHistoryState extends State<ATransactionHistory> {
  final transaction =[
    {
      'name':'Arjun Malotra',
      'place':'Rajasthan Heritage Tour',
      'date&time':'Oct 24 , 10:45AM',
      'price':'+₹3,000',
      'status':'SUCCESS'   
    },
    {
      'name':'Arjun Malotra',
      'place':'Rajasthan Heritage Tour',
      'date&time':'Oct 24 , 10:45AM',
      'price':'-₹1,500',
      'status':'REFUNDED'   
    },    
    {
      'name':'Heet Tala',
      'place':'Rajasthan Heritage Tour',
      'date&time':'Oct 25 , 10:45AM',
      'price':'+₹4,000',
      'status':'SUCCESS'   
  
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(18),
          
          child: Column(
            children: [
              Container(
              width: double.infinity,  
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 128, 196, 252),
                borderRadius: BorderRadius.circular(12),
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(
                        'Financial Summary',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 6, 4, 72),
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text(
                        'Net Income',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height:55),

                      const Text(
                        'Total Received',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 55, 54, 54)
                        ),
                        ),
                        const Text(
                          '₹4.5L',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ 4.2L',
                        style: TextStyle(
                          fontSize: 30,
                          color: const Color.fromARGB(255, 5, 53, 125),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height:55),
                      const Text(
                        'Refunded',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 55, 54, 54)
                        ),
                      ),
                      const Text(
                        '₹30K',
                        style:TextStyle(
                          fontSize: 20,
                          color:Color.fromARGB(255, 180, 26, 15),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]
          ),

        ),
     ),
    );
          
  }
}