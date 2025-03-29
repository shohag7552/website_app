import 'package:flutter/material.dart';
import 'package:website_app/const/dimentions.dart';
import 'package:website_app/const/text_style.dart';

class HeaderWidget extends StatefulWidget {
  final GlobalKey aboutKey;
  final GlobalKey servicesKey;
  final GlobalKey contactKey;
  final TransformationController transformationController;
  const HeaderWidget({super.key, required this.aboutKey, required this.servicesKey, required this.contactKey, required this.transformationController});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  void _zoomToTarget(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        Offset targetOffset = renderBox.localToGlobal(Offset.zero);
        
        // Adjust position to bring the target into focus
        widget.transformationController.value = Matrix4.identity()
          ..translate(-targetOffset.dx, -targetOffset.dy)
          ..scale(2.0); // Zoom in to 2x
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "My Website",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _buildNavItem("Home", widget.aboutKey),
              _buildNavItem("About", widget.aboutKey),
              _buildNavItem("Services", widget.servicesKey),
              _buildNavItem("Contact", widget.contactKey),
            ],
          ),
        ],
      ),
      backgroundColor: Dimentions.cardColor,
    );
  }

  Widget _buildNavItem(String title, GlobalKey key){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: (){
          _zoomToTarget(key);
          // setState(() {
          //   key.currentContext!.findRenderObject()!.showOnScreen();
          //   widget.transformationController.value = Matrix4.identity()..scale(2.0);
          // });
          //  key.currentContext!.findRenderObject()!.showOnScreen();
        }, 
        child: Text(title, style: Style.textStyleBold.copyWith(fontSize: 16)),
      ),
    );
  }
}