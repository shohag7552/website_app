import 'package:flutter/material.dart';
import 'package:website_app/const/dimentions.dart';
class BlueBoxWidget extends StatelessWidget {
  final Widget child;
  final double width;
  const BlueBoxWidget({required this.child, super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Dimentions.cardColor,
        borderRadius: BorderRadius.circular(Dimentions.radiusSmall),
        border: Border.all(color: Dimentions.blackColor, width: 1.2),
      ),
      child: child,
    );
  }
}