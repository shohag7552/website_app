import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/commons/custom_button.dart';
import 'package:website_app/const/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:website_app/const/utils.dart';

const List<String> dropdownList1 = <String>['a new', 'an existing'];
const List<String> dropdownList2 = <String>['Android', 'iOS', 'Android & iOS', "I don't know"];
const List<String> dropdownList3 = <String>['>5k\$', '5k\$ - 10k\$', '10k\$ - 100k\$', ">100k\$", "Undecided"];
const List<String> dropdownList4 = <String>['Basic', 'Custom', 'Undecided'];
const List<String> dropdownList5 = <String>['<1 Month', '1-6 Months', '>6 Months', 'Undecided'];
const List<String> dropdownList6 = <String>['As soon as possible', 'in a few weeks', 'Undecided'];

class WhatYouNeedWidget extends StatefulWidget {
  const WhatYouNeedWidget({super.key});

  @override
  State<WhatYouNeedWidget> createState() => _WhatYouNeedWidgetState();
}

class _WhatYouNeedWidgetState extends State<WhatYouNeedWidget> {

  String dropdownValue1 = dropdownList1.first;
  String dropdownValue2 = dropdownList2.first;
  String dropdownValue3 = dropdownList3.first;
  String dropdownValue4 = dropdownList4.first;
  String dropdownValue5 = dropdownList5.first;
  String dropdownValue6 = dropdownList6.first;
  final TextEditingController _controller = TextEditingController();

  final String text1 = "I need help developpin";
  final String text2 = "app, that need to work on the";
  final String text3 = "platform. The budget for this project is";
  final String text4 = "The app should have a";
  final String text5 = "design, and the app should be develop in";
  final String text6 = "The project should start";

  Future<void> sendEmail(String userEmail, String message) async {
  const serviceId = Utils.serviceId;
  const templateId = Utils.templateId;
  const publicKey = Utils.publicKey;

  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      "service_id": serviceId,
      "template_id": templateId,
      "user_id": publicKey,
      "template_params": {
        "title": 'New project request',
        "name": 'John Doe',
        "time": DateTime.now().toString(),
        "email": userEmail,
        "message": message,
      }
    }),
  );

  if (response.statusCode == 200) {
    print("Email sent successfully!");
   
    _controller.clear();

    dropdownValue1 = dropdownList1.first;
    dropdownValue2 = dropdownList2.first;
    dropdownValue3 = dropdownList3.first;
    dropdownValue4 = dropdownList4.first; 

  } else {
    print("Failed to send email: ${response.body}");
  }
}

  @override
  Widget build(BuildContext context) {

    return BlueBoxWidget(
      width: 300, 
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Align(alignment: Alignment.center, child: Text("Tell Me What You Need", style: Style.textStyleBold)),
        const SizedBox(height: 5),

        Align(
          alignment: Alignment.center, 
          child: Text(
            "Tell me what you need, so we can schudle a free consultation call.",
            style: Style.textStyleNormal.copyWith(fontWeight: FontWeight.w700), textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),

        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          Text(text1, style: Style.textStyleNormal),
          const SizedBox(width: 5),

          SizedBox(
            height: 25,
            child: DropdownButton<String>(
              value: dropdownValue1,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 2,
              padding: EdgeInsets.zero,
              iconSize: 16,
              // style: const TextStyle(color: Colors.deepPurple, fontSize: 8),
              underline: Container(height: 0.4, color: Colors.black,),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue1 = value!;
                });
              },
              items:dropdownList1.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: Style.textStyleNormal,));
                }).toList(),
            ),
          ),
          const SizedBox(width: 5),

          Text(text2, style: Style.textStyleNormal),
          const SizedBox(width: 5),

          SizedBox(
            height: 25,
            child: DropdownButton<String>(
              value: dropdownValue2,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 2,
              padding: EdgeInsets.zero,
              iconSize: 16,
              underline: Container(height: 0.4, color: Colors.black,),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue2 = value!;
                });
              },
              items: dropdownList2.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: Style.textStyleNormal,));
                }).toList(),
            ),
          ),
          const SizedBox(width: 5),

          Text(text3, style: Style.textStyleNormal),
          const SizedBox(width: 5),

          SizedBox(
            height: 25,
            child: DropdownButton<String>(
              value: dropdownValue3,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 2,
              padding: EdgeInsets.zero,
              iconSize: 16,
              underline: Container(height: 0.4, color: Colors.black,),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue3 = value!;
                });
              },
              items: dropdownList3.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: Style.textStyleNormal,));
                }).toList(),
            ),
          ),
          const SizedBox(width: 5),

          Text(text4, style: Style.textStyleNormal),
          const SizedBox(width: 5),

          SizedBox(
            height: 25,
            child: DropdownButton<String>(
              value: dropdownValue4,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 2,
              padding: EdgeInsets.zero,
              iconSize: 16,
              underline: Container(height: 0.4, color: Colors.black,),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue4 = value!;
                });
              },
              items: dropdownList4.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: Style.textStyleNormal,));
                }).toList(),
            ),
          ),
          const SizedBox(width: 5),

          Text(text5, style: Style.textStyleNormal),
          const SizedBox(width: 5),

          SizedBox(
            height: 25,
            child: DropdownButton<String>(
              value: dropdownValue5,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 2,
              padding: EdgeInsets.zero,
              iconSize: 16,
              underline: Container(height: 0.4, color: Colors.black,),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue5 = value!;
                });
              },
              items: dropdownList5.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: Style.textStyleNormal,));
                }).toList(),
            ),
          ),
          const SizedBox(width: 5),

          Text(text6, style: Style.textStyleNormal),
          const SizedBox(width: 5),

          SizedBox(
            height: 25,
            child: DropdownButton<String>(
              value: dropdownValue6,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 2,
              padding: EdgeInsets.zero,
              iconSize: 16,
              underline: Container(height: 0.4, color: Colors.black,),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue6 = value!;
                });
              },
              items: dropdownList6.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value, style: Style.textStyleNormal,));
                }).toList(),
            ),
          ),

        ]),
        const SizedBox(height: 10),

        Wrap(alignment: WrapAlignment.start, children: [
          Text("Please provide your email so I may reach you: ", style: Style.textStyleNormal),
          const SizedBox(width: 5),

          Container(
            // color: Colors.green,
            width: 200,
            height: 30,
            child: TextField(
             controller: _controller,
             keyboardType: TextInputType.emailAddress,
             style: Style.textStyleNormal,
             scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
                hintStyle: Style.textStyleNormal,
              ),
            ),
          ),
        ]),

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.center, 
          child: CustomButton(
            text: "Submit",
            onPressed: (){

              String message = "$text1 $dropdownValue1 $text2 $dropdownValue2 $text3 $dropdownValue3 $text4 $dropdownValue4 $text5 $dropdownValue5 $text6 $dropdownValue6";
              String userEmail = _controller.text;

              if(userEmail.isEmpty){
                print("Please provide your email");
                return;
              }else {
                sendEmail(userEmail, message);
              }

            },
          ),
        ),

      ]),
    );
  }
}