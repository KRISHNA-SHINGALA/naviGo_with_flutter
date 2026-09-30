import 'package:flutter/material.dart';

class ATransactionHistory extends StatefulWidget {
  const ATransactionHistory({super.key});

  @override
  State<ATransactionHistory> createState() => _ATransactionHistoryState();
}

class _ATransactionHistoryState extends State<ATransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade500,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Financial Summary',
                          style: TextStyle(
                          color: Color.fromARGB(255, 1, 8, 53),
                          fontSize: 15
                          ),
                        ),
                        const Text(
                          'Net Income',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 39, 39, 39),
                            fontWeight: FontWeight.bold
                          ),
                        ), 
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          ),
      ) ,
    );
  }
}