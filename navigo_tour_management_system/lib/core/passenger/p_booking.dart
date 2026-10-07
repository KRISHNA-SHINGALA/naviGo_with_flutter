import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/p_payment.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // Static Controllers
  final TextEditingController nameController =
      TextEditingController(text: 'Shingala Krishna');

  final TextEditingController ageController =
      TextEditingController(text: '19');

  final TextEditingController phoneController =
      TextEditingController(text: '1234567890');

  final TextEditingController specialRequestController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
  icon: const Icon(
    Icons.arrow_back,
    color: Color(0xFF003366),
  ),
  onPressed: () {
    Navigator.pop(context);
  },
),

        title: const Text(
          'Enter Details',
          style: TextStyle(
            color: Color(0xFF003366),
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // 1. Trip Summary Card
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(16.0),

                decoration: BoxDecoration(
                  color: const Color(0xFFD7E3FF),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'TRIP SUMMARY',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003366),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Jasawant thada',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003366),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Row(
                      children: [

                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: Color(0xFF003366),
                        ),

                        SizedBox(width: 6),

                        Text(
                          '12 Oct, 2025',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(width: 20),

                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Color(0xFF003366),
                        ),

                        SizedBox(width: 6),

                        Text(
                          '10:00 AM',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Price per passenger: ₹1250',
                      style: TextStyle(
                        color: Color(0xFF1E50A2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. Passenger Information Header
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  const Text(
                    'Passenger Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFFD7E3FF),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: const Text(
                      '1 of 1',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003366),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 12),

              // 3. Passenger Form Box
              Container(
                padding: const EdgeInsets.all(14.0),

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),

                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Passenger 1 (Primary)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 4),

                    TextField(
                      controller: nameController,

                      decoration: InputDecoration(
                        filled: true,

                        fillColor:
                            const Color(0xFFE8F0FE),

                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10),

                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        Expanded(
                          flex: 1,

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              const Text(
                                'Age',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 4),

                              TextField(
                                controller: ageController,

                                keyboardType:
                                    TextInputType.number,

                                decoration:
                                    InputDecoration(
                                  filled: true,

                                  fillColor:
                                      const Color(0xFFE8F0FE),

                                  contentPadding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),

                                  border:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(
                                      10,
                                    ),

                                    borderSide:
                                        BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          flex: 2,

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              const Text(
                                'Phone Number',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 4),

                              TextField(
                                controller: phoneController,

                                keyboardType:
                                    TextInputType.phone,

                                decoration:
                                    InputDecoration(
                                  filled: true,

                                  fillColor:
                                      const Color(0xFFE8F0FE),

                                  contentPadding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),

                                  border:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(
                                      10,
                                    ),

                                    borderSide:
                                        BorderSide.none,
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

              // 4. Add Passenger Button
              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content: Text(
                          'Passenger ${nameController.text} added successfully!',
                        ),

                        backgroundColor:
                            Colors.green,

                        duration:
                            const Duration(seconds: 2),
                      ),
                    );
                  },

                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.blue,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                    ),

                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),

                  child: const Text(
                    '+ Add Another Passenger',

                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 5. Special Requests Field
              const Text(
                'Special Requests',

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller:
                    specialRequestController,

                maxLines: 3,

                decoration: InputDecoration(
                  hintText:
                      'e.g. Dietary requirements, assistance needed, or preferred seating...',

                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),

                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  enabledBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),

                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 6. Privacy Note Text
              const Text(
                'Personal information is collected only for tour logistics and safety purposes as per our privacy policy.',

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 25),

              // 7. Divider Line
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),

              const SizedBox(height: 10),

              // 8. Grand Total + Processed Button
              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),

                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,

                  children: [

                    // Grand Total
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          'GRAND TOTAL',

                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          '₹ 5000',

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B4A8F),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 15),

                    // Processed Button
                    Expanded(
                      child: SizedBox(
                        height: 40,

                        child: ElevatedButton(
                         onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const PaymentScreen(),
    ),
  );
},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF372BBE),

                            foregroundColor:
                                Colors.white,

                            elevation: 0,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(7),
                            ),
                          ),

                          child: const Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              Text(
                                'Processed',

                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 22,
                              ),
                            ],
                          ),
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
      ),
    );
  }
}