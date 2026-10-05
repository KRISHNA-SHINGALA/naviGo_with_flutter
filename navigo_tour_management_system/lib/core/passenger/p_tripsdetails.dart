import 'package:flutter/material.dart';

class Tripdetails extends StatefulWidget {
  const Tripdetails({super.key});

  @override
  State<Tripdetails> createState() => _TripdetailsState();
}

class _TripdetailsState extends State<Tripdetails> {
  int quantity = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [

            // Top Image
            Container(
              height: 220,
              width: double.infinity,

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rajasthan.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),

                      color: Colors.deepPurple,

                      child: const Text(
                        'PREMIUM EXPEDITION',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Rajasthan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      'Dec 10 - Dec 15, 2025',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),

                    const Text(
                      '10:00 AM Departure',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Logistics Status
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: const Color(0xffd9ebff),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // Logistics Heading
                  Row(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(8),

                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 9, 4, 96),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        'Logistics Status',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: const Text(
                          'LIVE UPDATES',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color.fromARGB(255, 2, 77, 138),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Available Seats and Capacity
                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: const Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                'AVAILABLE\nSEATS',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                '12',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: const Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                'TOTAL\nCAPACITY',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                '40',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // 70% Progress Bar
                  Stack(
                    children: [

                      // White full bar
                      Container(
                        height: 8,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      // Blue 70% bar
                      FractionallySizedBox(
                        widthFactor: 0.70,

                        child: Container(
                          height: 8,

                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 1, 9, 101),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Padding(
                    padding: EdgeInsets.only(left: 5),

                    child: Text(
                      '70% of seats are already reserved for this\nexpedition.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Select Tickets
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),

              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Select Tickets',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'Standard All-Inclusive Entry',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,

                        children: [

                          Text(
                            'Per Guest',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            '₹1,250',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 2, 7, 111),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Divider(),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(5),

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),

                        child: Row(
                          children: [

                            // Minus
                            GestureDetector(
                              onTap: () {

                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }

                              },

                              child: const CircleAvatar(
                                radius: 12,

                                backgroundColor:
                                    Colors.white,

                                child: Text(
                                  '−',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),

                              child: Text(
                                '$quantity',

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),

                            // Plus
                            GestureDetector(
                              onTap: () {

                                setState(() {
                                  quantity++;
                                });

                              },

                              child: const CircleAvatar(
                                radius: 12,

                                backgroundColor:
                                    Color.fromARGB(255, 5, 2, 96),

                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Expedition Highlights
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 12),

              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  'EXPEDITION HIGHLIGHTS',

                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Luxury Accommodation
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10),

              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),

                borderRadius:
                    BorderRadius.circular(12),
              ),

              child: Row(
                children: [

                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),

                    child: const Icon(
                      Icons.hotel,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Luxury Accommodation',

                          style: TextStyle(
                            fontSize: 17,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          '5-star boutique hotels with sea-view terraces.',

                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Private Yacht Tour
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10),

              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),

                borderRadius:
                    BorderRadius.circular(12),
              ),

              child: Row(
                children: [

                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),

                    child: const Icon(
                      Icons.directions_boat,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Private Yacht Tour',

                          style: TextStyle(
                            fontSize: 17,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Full day exploring Capri and the Emerald Grotto.',

                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // View On Route Map
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10),

              height: 55,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius:
                    BorderRadius.circular(30),
              ),

              child: const Center(
                child: Text(
                  'View On Route Map',

                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Grand Total
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(15),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    'GRAND TOTAL',

                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),

                    child: const Text(
                      '₹ 5000',

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight:
                            FontWeight.bold,
                        color: Color.fromARGB(255, 2, 7, 109),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}