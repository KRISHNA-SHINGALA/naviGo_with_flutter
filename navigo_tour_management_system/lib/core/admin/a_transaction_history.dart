import 'package:flutter/material.dart';

class ATransactionHistory extends StatefulWidget {
  const ATransactionHistory({super.key});

  @override
  State<ATransactionHistory> createState() => _ATransactionHistoryState();
}

class _ATransactionHistoryState extends State<ATransactionHistory>
 {final transaction= [
  {
    'name':'Arjun Malhotra',
    'amount':'+ ₹3,000',
    'place': 'Rajasthan Heritage Tour',
    'date':'Oct 24, 10:45AM',
    'status':'SUCCESS'

  },
  {
    'name':'Arjun Malhotra',
    'amount':'- ₹1,500',
    'place': 'Rajasthan Heritage Tour',
    'date':'Oct 24, 10:45AM',
    'status':'REFUNDED'

  },
  {
    'name':'Heet Tala',
    'amount':'+ ₹3,500',
    'place': 'Rajasthan Heritage Tour',
    'date':'Oct 24, 10:45AM',
    'status':'SUCCESS'

  }
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const  EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                color: const Color(0xFFD7E3FF),
                borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Financial Summary',
                      style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontSize: 12
                      ), 
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                        'Net Income',
                          style: TextStyle(
                          color: Color.fromARGB(255, 56, 56, 56),
                          fontSize: 15,
                          ),
                        ),
                        const Text(
                          '₹4.2L',
                          style: TextStyle(
                          color: Color.fromARGB(255, 12, 16, 73),
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                      children: [
                        const Text(
                        'Total Received ',
                        style: TextStyle(
                        color: Color.fromARGB(255, 56, 56, 56),
                        fontSize: 10,
                        
                        ),
                        ),
                         const Text(
                        '₹4.5L',
                        style: TextStyle(
                        color: Color.fromARGB(255, 56, 56, 56),
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                        'Refunded',
                        style: TextStyle(
                        color: Color.fromARGB(255, 56, 56, 56),
                        fontSize: 10,

                        ),
                        ),
                        
                        const Text(
                        '₹30K',
                        style: TextStyle(
                        color: Color.fromARGB(255, 104, 3, 3),
                        fontSize: 15,
                        fontWeight: FontWeight.bold

                        ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 3, 3, 3),
                      fontWeight: FontWeight.bold
                    ),
                   ),
              ],
            ),
            const SizedBox(height: 15),
            for(final transaction in transaction )
            Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            child: Padding(
              padding:const EdgeInsets.all(18),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      transaction['name']!,
                      style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:Colors.black 
                      ) ,
                    ),
                        Text(
                          transaction['place']!,
                          style:TextStyle(
                          fontSize: 10,
                          color:Colors.black 
                          ) ,
                        ),
                        Text(
                          transaction['date']!,
                          style:TextStyle(
                          fontSize: 10,
                          color:Colors.grey 
                          ) ,
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transaction['amount']!,
                        style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: transaction['status']=='SUCCESS'?Colors.green:Colors.red
                        ) ,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                        horizontal: 7, vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: transaction['status']=='SUCCESS'?Colors.green[100]:Colors.red[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Text(
                        transaction['status']!,
                        style:TextStyle(
                        fontSize: 10,
                        color: transaction['status']=='SUCCESS'?Colors.green:Colors.red
                        ) ,
                      ),
                      ),
                    ],
                  )
                ],
              ),
              ),
            )
            
          ],
          ),
        ),
      ),
    );
  }
}