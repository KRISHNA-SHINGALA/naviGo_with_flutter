import 'package:flutter/material.dart';

class Activebooking extends StatefulWidget {
  const Activebooking({super.key});

  @override
  State<Activebooking> createState() => _ActivebookingState();
}

class _ActivebookingState extends State<Activebooking> {
  final active =[
    {
      'name':'Dhruvi ',
      'number':'2375875445',
      'status':'CONFIRMED',
      'place':'Mahakaleshwar Temple',
      'seat':'2 Seat'
    },
    {
      'name':'Foram ',
      'number':'2375357545',
      'status':'PAID',
      'place':'Solang Valley,Manli',
      'seat':'1 Seat'
    },
    {
      'name':'Dhara ',
      'number':'5647382929',
      'status':'CONFIRMED',
      'place':'Jaswant Thada,Rajasthan',
      'seat':'4 Seat'
    },
    {
      'name':'Vansika ',
      'number':'4538205445',
      'status':'PAID',
      'place':'Mahakaleshwar Temple',
      'seat':'2 Seat'
    },
    {
      'name':'Vishal ',
      'number':'2300340045',
      'status':'CONFIRMED',
      'place':'Solang Valley,Manali',
      'seat':'1 Seat'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
        title: const Text(
          'Passenagers & Requests',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             for (final active in active)
  Card(
    margin: const EdgeInsets.only(bottom: 15),
    elevation: 0,
    color: const Color(0xFFD8E3FF),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),

    child: Padding(
      padding: const EdgeInsets.all(12),

      child: Row(
        children: [
          const Icon(
            Icons.person,
            size: 40,
            color: Colors.black,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  active['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Text(
                  active['number']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  active['place']!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0047AB),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 5),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: active['status'] == 'CONFIRMED'
                      ? const Color(0xFFD2F8E0)
                      : const Color(0xFF0047AB),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  active['status']!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: active['status'] == 'CONFIRMED'
                        ? Colors.green.shade900
                        : Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                active['seat']!,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
],
),),),);}}