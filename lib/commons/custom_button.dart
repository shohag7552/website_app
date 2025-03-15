import 'package:flutter/material.dart';
import 'package:website_app/const/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
        minimumSize: WidgetStateProperty.all(Size(100, 30)),
        overlayColor: WidgetStateProperty.all(Colors.blueGrey.shade800),
        mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
        child: Text(text, style: Style.textStyleNormal.copyWith(color: Colors.white)),
    );
  }
}