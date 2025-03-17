import 'package:flutter/material.dart';
import 'package:website_app/commons/blue_box_widget.dart';
import 'package:website_app/commons/custom_button.dart';
import 'package:website_app/const/text_style.dart';

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

        Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          Text("I need help developpin", style: Style.textStyleNormal),
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

          Text("app, that need to work on the", style: Style.textStyleNormal),
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

          Text("platform. The budget for this project is", style: Style.textStyleNormal),
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

          Text("The app should have a", style: Style.textStyleNormal),
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

          Text("design, and the app should be develop in", style: Style.textStyleNormal),
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

          Text("The project should start ", style: Style.textStyleNormal),
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

        CustomButton(text: "Submit", onPressed: (){}),

      ]),
    );
  }
}