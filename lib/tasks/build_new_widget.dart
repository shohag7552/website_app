import 'package:flutter/material.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/commons/custom_button.dart';
import 'package:website_app/const/text_style.dart';

class BuildNewWidget extends StatelessWidget {
  const BuildNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlueBoxWidget(
      width: 200, 
      child: Column(children: [
        Text("Let's Build Something New", style: Style.textStyleBold),
        const SizedBox(height: 5),

        Image.network(
          // 'https://www.hashstudioz.com/blog/wp-content/uploads/2020/12/key-differences-between-android-and-ios.png',
          'https://thumbs.web.sapo.io/?W=1550&H=0&png=1&delay_optim=1&webp=1&epic=MjYyNmyYY+GQB/+4UOAlA+WVGr26ksUiNqbz39N8Tg4pskaIiRxTlLM8HTcImmqZymr4MZUFL1S9Bhcdxm51ZWy1XyAiOV01ma/OyDYgq0oXk2k=',
          width: 120,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),

        Text(
          "I'll bring your idea to life with Flutter. And help you to setup a new app",
          style: Style.textStyleNormal, textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        CustomButton(text: "Let's Build", onPressed: (){}),

      ]),
    );
  }
}