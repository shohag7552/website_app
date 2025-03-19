import 'package:flutter/material.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/commons/custom_button.dart';
import 'package:website_app/const/text_style.dart';
class ImproveExistingWidget extends StatelessWidget {
  const ImproveExistingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlueBoxWidget(
      width: 220, 
      child: Column(children: [
        Text("Or Let's Improve Your Existing App", style: Style.textStyleBold),
        const SizedBox(height: 5),

        Image.network(
          'https://s3-alpha.figma.com/hub/file/4638172767/89591f7c-c534-4db0-b92f-5d8c5b2e2c8e-cover.png',
          width: 100,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),

        Text(
          "I can help you to improve your existing app. I'll add new features, fix bugs and improve performance.",
          style: Style.textStyleNormal, textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        CustomButton(text: "Let's Improve", onPressed: (){}),

      ]),
    );
  }
}