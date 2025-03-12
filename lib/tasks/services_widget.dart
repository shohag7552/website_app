import 'package:flutter/material.dart';
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Services',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}