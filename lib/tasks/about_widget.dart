import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/const/dimentions.dart';
import 'package:website_app/const/images.dart';
import 'package:website_app/const/text_style.dart';
class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlueBoxWidget(
      width: 270,
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
                'I am spitalize in App Development using Flutter. I have experience in building mobile applications for both Android and iOS platforms.',
                style: Style.textStyleNormal, textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),

              Row(mainAxisAlignment: MainAxisAlignment.center, spacing: 15, children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse('https://www.linkedin.com/in/mehedi-hasan-7b28ab15b/');

                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset(Images.linkdin, fit: BoxFit.cover),
                    ),
                  ),
                ),

                SizedBox(
                  width: 20,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse('https://www.facebook.com/mdmehedi.hasan.3139/');

                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset(Images.facebook, fit: BoxFit.cover),
                      ),
                  ),
                ),

                SizedBox(
                  width: 20,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse('https://github.com/shohag7552');

                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset(Images.github, fit: BoxFit.cover),
                      ),
                  ),
                ),

                SizedBox(
                  width: 20,
                  height: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () async {
                      //   final Uri emailUri = Uri(
                      //   scheme: 'mailto',
                      //   path: 'mehedi05739@gmail.com',
                      //   queryParameters: {'subject': 'Hello from Flutter!'},
                      // );

                      // // ignore: deprecated_member_use
                      // if (await canLaunch(emailUri.toString())) {
                      //   await launch(emailUri.toString());
                      // } else {
                      //   throw 'Could not launch email app';
                      // }
                        final Uri url = Uri.parse('mehedi05739@gmail.com');

                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Image.asset(Images.gamil, fit: BoxFit.cover),
                    ),
                  ),
                ),

              ]),

            ],
          ),
        ),

      ]),
    );
  }
}