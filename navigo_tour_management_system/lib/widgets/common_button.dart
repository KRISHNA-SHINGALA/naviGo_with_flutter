import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;             // Har page par button ka text alag hoga
  final VoidCallback onPressed;  // Har page par click hone ka action alag hoga
  final Color? color;            // Optional: Agar kisi page par red button chahiye
  
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Button puri width lega
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Agar color pass kiya hai toh wo use hoga, warna default Royal Blue
          backgroundColor: color ?? const Color(0xFF0056D2),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Rounded corners
          ),
        ),
        child: Text(
          text, // Yahan wo text aayega jo page se bheja jayega
          style: const TextStyle(
            fontSize: 16, 
            color: Colors.white, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}