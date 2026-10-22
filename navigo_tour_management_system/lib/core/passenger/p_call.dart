import 'package:flutter/material.dart';

class PassengerCall extends StatefulWidget {
  const PassengerCall({super.key});

  @override
  State<PassengerCall> createState() => _PassengerCallState();
}

class _PassengerCallState extends State<PassengerCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Tour Manager'),
        backgroundColor: const Color(0xFF0056D2),
        foregroundColor: Colors.white,
      ),

      // Use the available screen space to display the complete image.
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/p_call.jpg',
          fit: BoxFit.contain, // Prevents cropping and stretching.

          // Display a placeholder if the image cannot be loaded.
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Add your image path here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}