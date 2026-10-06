import 'package:flutter/material.dart';

class CancelRequest extends StatefulWidget {
  const CancelRequest({super.key});

  @override
  State<CancelRequest> createState() =>
      _CancelRequestState();
}

class _CancelRequestState
    extends State<CancelRequest> {

  final refunds = [
    {
      'name': 'Garvi',
      'number': '1234567890',
      'place': 'Mahakaleshwar Temple',
      'seat': '2 Seats',
      'amount': '₹1500',
      'reason': 'Medical emergency',
    },
    {
      'name': 'Foram',
      'number': '1234567890',
      'place': 'Solang Valley, Manali',
      'seat': '1 Seats',
      'amount': '₹8200',
      'reason': 'Scheduling Conflict',
    },
    {
      'name': 'Bhoomi',
      'number': '1234567890',
      'place': 'Jaswant Thada, Rajasthan',
      'seat': '4 Seats',
      'amount': '₹4200',
      'reason': 'Medical emergency',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),

        child: Column(
          children: [

            for (final refund in refunds)

              Card(
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 0,
                color: const Color(0xFFD8E3FF),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Row(
                        children: [

                          const Icon(
                            Icons.person,
                            color: Color(0xFF0047AB),
                            size: 22,
                          ),

                          const SizedBox(width: 25),

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                refund['name']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              Text(
                                refund['number']!,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [

                          const Icon(
                            Icons.map_outlined,
                            size: 14,
                            color: Color(0xFF0047AB),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              refund['place']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const SizedBox(width: 5),

                          Container(
                            padding: const EdgeInsets.all(5),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(4),
                            ),

                            child: Text(
                              refund['seat']!,
                              style: const TextStyle(
                                fontSize: 9,
                                color: Color(0xFF0047AB),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(0xFFFFDCD9),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),

                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Icon(
                              Icons.circle,
                              size: 6,
                              color: Colors.red,
                            ),

                            SizedBox(width: 8),

                            Text(
                              'PENDING REFUND',
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          const Text(
                            'Refund Amount:',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                          ),

                          Text(
                            refund['amount']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Reason: ${refund['reason']}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Approve Refund and Decline buttons
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        children: [

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF0047AB),
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Approve Refund',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),

                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(
                                color: Colors.red,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Decline',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}