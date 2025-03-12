import 'package:flutter/material.dart';
class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'About Me',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}