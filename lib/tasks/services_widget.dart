import 'package:flutter/material.dart';
import 'package:website_app/commons/clip_widget.dart';
import 'package:website_app/commons/white_box_widget.dart';
import 'package:website_app/const/text_style.dart';
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBoxWidget(
      width: 300,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Services", style: Style.textStyleBold),
        const SizedBox(height: 5),

        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            ClipWidget(text: "Flutter Development"),
            ClipWidget(text: "Technical Consultation"),
          ],
        ),
        const SizedBox(height: 10),

        Text("How I Can Help", style: Style.textStyleBold),
        const SizedBox(height: 5),

        Text(
          "If you are StartUp, I can help bring your idea to life.",
          style: Style.textStyleNormal, textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),

        Text(
          "If you are a Tech Company, I can help fill a gap in your team and help you build the high quality of app for your clients .",
          style: Style.textStyleNormal, textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),

        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            ClipWidget(text: "6amMart"),
            ClipWidget(text: "Stackfood"),
            ClipWidget(text: "GrowFresh"),
            ClipWidget(text: "Hexacom"),
          ],
        ),
        const SizedBox(height: 10),

        Text(
          "If you are a Business Owner, I can offer you consulting service to improve your existing software and help new features.",
          style: Style.textStyleNormal, textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),

      ]),
    );
  }
}