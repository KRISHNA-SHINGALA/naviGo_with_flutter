import 'package:flutter/material.dart';

class AdminOTP extends StatefulWidget {
  const AdminOTP({super.key});

  @override
  State<AdminOTP> createState() => _AdminOTPState();
}

class _AdminOTPState extends State<AdminOTP> {
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                // Back Button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 28,
                  ),
                ),

                const SizedBox(height: 30),

                // Title
                const Text(
                  "Verify OTP",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Description
                const Text(
                  "Enter the 4-digit OTP sent to your registered email address.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF596273),
                  ),
                ),

                const SizedBox(height: 40),

                // OTP Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    otpBox(otp1, otp2),

                    otpBox(otp2, otp3),

                    otpBox(otp3, otp4),

                    otpBox(otp4, null),

                  ],
                ),

                const SizedBox(height: 35),

                // Timer
                const Center(
                  child: Text(
                    "OTP expires in 00:59",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF596273),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      String otp =
                          otp1.text +
                          otp2.text +
                          otp3.text +
                          otp4.text;

                      if (otp.length == 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("OTP Verified"),
                          ),
                        );

                        // Yahan Reset Password page par navigate karna.
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter complete OTP"),
                          ),
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0056D2),
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Resend OTP
                Center(
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("OTP resent"),
                        ),
                      );
                    },

                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0056D2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // OTP Box
  Widget otpBox(
    TextEditingController controller,
    TextEditingController? nextController,
  ) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,

        onChanged: (value) {
          if (value.isNotEmpty && nextController != null) {
            FocusScope.of(context).nextFocus();
          }
        },

        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFCCCCCC),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF0056D2),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}