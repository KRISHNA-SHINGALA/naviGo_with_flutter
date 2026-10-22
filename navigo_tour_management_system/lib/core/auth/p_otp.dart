
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassengerOTP extends StatefulWidget {
  const PassengerOTP({super.key});

  @override
  State<PassengerOTP> createState() => _PassengerOTPState();
}

class _PassengerOTPState extends State<PassengerOTP> {
  // Controllers for the four OTP digits
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();

  // Variables used to manage the OTP countdown
  Timer? _timer;
  int _secondsRemaining = 59;
  bool _isOtpExpired = false;

  @override
  void initState() {
    super.initState();

    // Start the countdown when the page opens
    _startOtpTimer();
  }

  // Start or restart the OTP countdown timer
  void _startOtpTimer() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = 59;
      _isOtpExpired = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        // Stop the timer when the OTP expires
        timer.cancel();

        setState(() {
          _isOtpExpired = true;
        });
      }
    });
  }

  // Convert the remaining seconds into MM:SS format
  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    // Cancel the timer to prevent it from running after the page closes
    _timer?.cancel();

    // Dispose all text controllers
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();

    super.dispose();
  }

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

                // Back button
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

                // Page title
                const Text(
                  "Verify OTP",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Instructions for entering the OTP
                const Text(
                  "Enter the 4-digit OTP sent to your registered email address.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF596273),
                  ),
                ),

                const SizedBox(height: 40),

                // Four OTP input boxes
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

                // Countdown banner that updates every second
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _isOtpExpired
                          ? Colors.red.shade50
                          : const Color(0xFFE2EAFB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _isOtpExpired
                          ? "OTP expired. Please resend OTP."
                          : "OTP expires in $_formattedTime",
                      style: TextStyle(
                        fontSize: 14,
                        color: _isOtpExpired
                            ? Colors.red
                            : const Color(0xFF596273),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Verify OTP button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Combine all four OTP digits
                      String otp = otp1.text +
                          otp2.text +
                          otp3.text +
                          otp4.text;

                      // Prevent verification after the countdown expires
                      if (_isOtpExpired) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "OTP expired. Please resend OTP.",
                            ),
                          ),
                        );
                        return;
                      }

                      // Check that all four characters are numeric digits
                      if (otp.length != 4 ||
                          !RegExp(r'^[0-9]{4}$').hasMatch(otp)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter complete OTP"),
                          ),
                        );
                        return;
                      }

                      // Input validation passed; actual OTP verification
                      // must be performed by the backend
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("OTP entered successfully"),
                        ),
                      );

                      // Navigate to the Reset Password page after
                      // implementing actual OTP verification
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

                // Resend OTP button
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Restart the countdown
                      _startOtpTimer();

                      // Clear the previously entered OTP digits
                      otp1.clear();
                      otp2.clear();
                      otp3.clear();
                      otp4.clear();

                      // Display a confirmation message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "OTP timer restarted. Connect email service to resend OTP.",
                          ),
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

  // Build an individual OTP input box
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

        // Allow only one numeric digit in each input box
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],

        onChanged: (value) {
          // Move focus to the next input box after entering a digit
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
