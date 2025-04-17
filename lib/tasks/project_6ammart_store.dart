import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_app/commons/clip_widget.dart';
import 'package:website_app/commons/white_box_widget.dart';
import 'package:website_app/const/images.dart';
import 'package:website_app/const/text_style.dart';
class Project6amMartStore extends StatelessWidget {
  const Project6amMartStore({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBoxWidget(
      width: 150,
      child: Column(
        children: [
          Image.asset(Images.ammartStore),

          Text("6amMart Store", style: Style.textStyleBold),
          const SizedBox(height: 5),
        
          Text(
            "This is a Multi-vendor E-commerce app's Store app. Which is use to maintain the store setup and orders.",
            style: Style.textStyleNormal, textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
    
          Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
    
            ClipWidget(text: "Flutter"),
            ClipWidget(text: "IOS"),
            ClipWidget(text: "Android"),
            ClipWidget(text: "Firebase"),
            ClipWidget(text: "PHP"),
            ClipWidget(text: "Laravel"),
    
          ],
        ),
          const SizedBox(height: 10),

          Row(mainAxisSize: MainAxisSize.min, children: [
            Text("Click for see the demo", style: Style.textStyleNormal.copyWith(fontSize: 10)),
            const SizedBox(width: 5),

            InkWell(
              onTap: () async {
                final Uri _url = Uri.parse('https://6ammart.app/multi-vendor-marketplace-software-project-live-demo/');

                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                  }
              },
              child: Text("link", style: Style.textStyleBold.copyWith(fontSize: 10)),
            ),

          ]),
        ],
      ),
    );
  }
}