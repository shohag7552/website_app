import 'package:flutter/material.dart';
import 'package:website_app/commons/clip_widget.dart';
import 'package:website_app/commons/white_box_widget.dart';
import 'package:website_app/const/images.dart';
import 'package:website_app/const/text_style.dart';

class ProtfolioWebsiteWidget extends StatelessWidget {
  const ProtfolioWebsiteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBoxWidget(
      width: 150,
      child: Column(
        children: [

          Image.asset(Images.protfolio),

           Text("Protfolio Website", style: Style.textStyleBold),
            const SizedBox(height: 5),
          
            Text(
              'This is a portfolio website that allows users to showcase their skills, projects, and contact information. It also supports dark mode.',
              style: Style.textStyleNormal, textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
      
            Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
      
              ClipWidget(text: "Flutter"),
              ClipWidget(text: "Web"),
              ClipWidget(text: "Getx"),
              ClipWidget(text: "Responsive"),
      
            ],
          ),
          const SizedBox(height: 10),

          Row(mainAxisSize: MainAxisSize.min, children: [
            Text("Click for see the demo", style: Style.textStyleNormal.copyWith(fontSize: 10)),
            const SizedBox(width: 5),

            InkWell(
              onTap: () {
                
              },
              child: Text("link", style: Style.textStyleBold.copyWith(fontSize: 10)),
            ),

          ]),

        ],
      ),
    );
  }
}