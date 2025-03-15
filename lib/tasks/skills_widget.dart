import 'package:flutter/material.dart';
import 'package:website_app/commons/clip_widget.dart';
import 'package:website_app/commons/white_box_widget.dart';
import 'package:website_app/const/text_style.dart';
class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBoxWidget(
      width: 250,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("About Me", style: Style.textStyleBold),
        const SizedBox(height: 5),

        Text(
          "Experienced Flutter Developer with over 3.5+ years of professional experience creating robust and dynamic mobile applications using Dart and the Flutter framework. Passionate about leveraging cutting-edge Flutter technologies, with a strong focus on delivering high-performance and user-friendly apps. Playing with Dart and exploring Flutter innovations is not just work but a personal hobby.",
          style: Style.textStyleNormal, textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Experience", style: Style.textStyleBold.copyWith(fontSize: 8)),
          Text("3.5+ years", style: Style.textStyleNormal),
        ]),
        const SizedBox(height: 5),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Education", style: Style.textStyleBold.copyWith(fontSize: 8)),
          Text("BSc in Computer Science", style: Style.textStyleNormal),
        ]),
        const SizedBox(height: 5),

        Text("Skills", style: Style.textStyleBold.copyWith(fontSize: 8)),
        const SizedBox(height: 5),

        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [

            ClipWidget(text: "Flutter"),
            ClipWidget(text: "Dart"),
            ClipWidget(text: "Firebase"),
            ClipWidget(text: "Provider"),
            ClipWidget(text: "GetX"),
            ClipWidget(text: "Bloc"),
            ClipWidget(text: "Rest API"),
            ClipWidget(text: "Git"),
            ClipWidget(text: "GitHub"),
            ClipWidget(text: "Trello"),
            ClipWidget(text: "Slack"),
            ClipWidget(text: "Figma"),
          ],
        ),


      ]),
    );
  }
}