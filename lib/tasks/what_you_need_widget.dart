import 'package:flutter/material.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/commons/custom_button.dart';
import 'package:website_app/const/text_style.dart';

class WhatYouNeedWidget extends StatelessWidget {
  const WhatYouNeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlueBoxWidget(
      width: 300, 
      child: Column(children: [
        Text("Tell Me What You Need", style: Style.textStyleBold),
        const SizedBox(height: 5),

        Text(
          "Tell me what you need, so we can schudle a free consultation call.",
          style: Style.textStyleNormal, textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        CustomButton(text: "Submit", onPressed: (){}),

      ]),
    );
  }
}