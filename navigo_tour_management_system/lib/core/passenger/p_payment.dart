import 'package:flutter/material.dart';
import 'package:navigo_tour_management_system/core/passenger/passenger_eticket_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'online';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color:  Color(0xFF003366),
            size: 32,
          ),

          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          'Payment',

          style: TextStyle(
            color: Color.fromARGB(255, 2, 10, 96),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // 🔹 Active Booking Summary Card
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16.0),

              decoration: BoxDecoration(
                color: const Color(0xFFD3E4F6),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: const [

                          Text(
                            'ACTIVE BOOKING',

                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            'Jasawant thada, Rajasthan',

                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),

                      // Compass Icon
                      Container(
                        padding: const EdgeInsets.all(6),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(8),
                        ),

                        child: const Icon(
                          Icons.explore_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [

                      // Seats Column
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: const [

                          Text(
                            'Seats',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            '2B, 2C',

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 24),

                      // Divider Line
                      Container(
                        height: 35,
                        width: 1,
                        color: Colors.black26,
                      ),

                      const SizedBox(width: 24),

                      // Total Amount Column
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: const [

                          Text(
                            'Total Amount',

                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            '₹1,250',

                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0D47A1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Heading: Select Payment Method
            const Text(
              'Select Payment Method',

              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Pay Online (UPI/Card) Option Card
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'online';
                });
              },

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                  border: Border.all(
                    color: selectedPaymentMethod == 'online'
                        ? const Color(0xFF1A237E)
                        : Colors.grey.shade300,

                    width: selectedPaymentMethod == 'online'
                        ? 2
                        : 1,
                  ),
                ),

                child: Row(
                  children: [

                    // Icon Box
                    Container(
                      width: 44,
                      height: 44,

                      decoration: const BoxDecoration(
                        color: Color(0xFF1A237E),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.credit_card,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Title & Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: const [

                          Text(
                            'Pay Online (UPI/Card)',

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            'Instant confirmation',

                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Radio Selection
                    Icon(
                      selectedPaymentMethod == 'online'
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,

                      color:
                          selectedPaymentMethod == 'online'
                              ? const Color(0xFF1A237E)
                              : Colors.grey,

                      size: 24,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Pay Offline (Cash to Admin) Option Card
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'offline';
                });
              },

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                  border: Border.all(
                    color: selectedPaymentMethod == 'offline'
                        ? const Color(0xFF1A237E)
                        : Colors.grey.shade300,

                    width: selectedPaymentMethod == 'offline'
                        ? 2
                        : 1,
                  ),
                ),

                child: Row(
                  children: [

                    // Icon Box
                    Container(
                      width: 44,
                      height: 44,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.payments_outlined,
                        color: Colors.black87,
                        size: 22,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Title & Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: const [

                          Text(
                            'Pay Offline (Cash to Admin)',

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            'Verify at the desk',

                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Radio Selection
                    Icon(
                      selectedPaymentMethod == 'offline'
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,

                      color:
                          selectedPaymentMethod == 'offline'
                              ? const Color(0xFF1A237E)
                              : Colors.grey,

                      size: 24,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Information Box (Grey Note)
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Container(
                    padding: const EdgeInsets.all(2),

                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.priority_high,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Text(
                      'Your booking details and ticket will be sent to your registered email immediately after payment confirmation.',

                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // 🔹 Confirm Booking Button
            Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),

             child: ElevatedButton(
  onPressed: () {
    if (selectedPaymentMethod == 'offline') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PassengerETicketScreen(),
        ),
      );
    }
  },

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF3024C9),

                  foregroundColor: Colors.white,

                  minimumSize:
                      const Size(double.infinity, 50),

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Text(
                      'Confirm Booking',

                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 35),

                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}