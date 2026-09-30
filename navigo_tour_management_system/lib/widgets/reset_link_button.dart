import 'package:flutter/material.dart';

class ResetLinkButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ResetLinkButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<ResetLinkButton> createState() => _ResetLinkButtonState();
}

class _ResetLinkButtonState extends State<ResetLinkButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0056D2),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Send Reset Link",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}