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
              )
            ],
          ),
        ),
      ),
    );
  }
}