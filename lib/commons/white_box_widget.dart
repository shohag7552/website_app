import 'package:flutter/material.dart';

class WhiteBoxWidget extends StatelessWidget {
  final Widget child;
  final double width;
  const WhiteBoxWidget({super.key, required this.child, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 1))],
      ),
      child: child,
    );
  }
}