import 'package:flutter/material.dart';
import 'package:website_app/const/dimentions.dart';
import 'package:website_app/const/text_style.dart';

class ClipWidget extends StatelessWidget {
  final String text;
  const ClipWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Dimentions.clipColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: Style.textStyleNormal.copyWith(color: Colors.white)),
    );
  }
}