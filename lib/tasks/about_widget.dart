import 'package:flutter/material.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/const/dimentions.dart';
import 'package:website_app/const/images.dart';
import 'package:website_app/const/text_style.dart';
class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlueBoxWidget(
      width: 250,
      child: Row(children: [

        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Dimentions.blackColor,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(Images.profile, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, I'm Mehedi", style: Style.textStyleBold),
              const SizedBox(height: 5),

              Text(
                'I am an one man agency that spitalize in App Development using Flutter.',
                style: Style.textStyleNormal, textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined, color: Dimentions.blackColor, size: 16)),
                IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm, color: Dimentions.blackColor, size: 16)),
                IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline, color: Dimentions.blackColor, size: 16)),

              ]),

            ],
          ),
        ),

      ]),
    );
  }
}