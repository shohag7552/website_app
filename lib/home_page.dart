import 'package:flutter/material.dart';
import 'package:website_app/components/custom_cursor_widget.dart';
import 'package:website_app/components/doted_background_painter.dart';
import 'package:website_app/components/lines_painter.dart';
import 'package:website_app/components/services_widget.dart';
import 'package:website_app/components/skills_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 double dotSpacing = 20.0;

  final TransformationController _transformationController = TransformationController();
  double zoomLevel = 1.0;
  Offset pointer = Offset.zero;
  bool isClicked = false;
  bool shouldHide = false;

  void _resetView() {
    _transformationController.value = Matrix4.identity(); // Reset to original position
  }

@override
  void initState() {
    super.initState();
    _transformationController.addListener(_onZoomChange);
  }

  void _onZoomChange() {
    setState(() {
      zoomLevel = _transformationController.value.getMaxScaleOnAxis();
    });
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onZoomChange);
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    Offset skillsOffset = Offset(height*0.7, width*0.2);
    Offset servicesOffset = Offset(height*0.4, width*0.3);

    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.none, // Hide system cursor
        onHover: (event) {
          setState(() {
            pointer = event.localPosition;
          });
        },
        child: Listener(
          onPointerDown: (_) {
            setState(() {
              isClicked = true;
            });
          },
          onPointerUp: (_) {
            setState(() {
              isClicked = false;
            });
          },
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 5.0,
          transformationController: _transformationController,
          child: Stack(
            children: [
              CustomPaint(
                painter: DottedBackgroundPainter(backgroundColor: Colors.grey, zoomLevel: zoomLevel),
                child: Stack(
                  children: [

                    CustomPaint(
                      size: Size(width, height), // Set the size of the canvas
                      painter: LinePainter(),
                    ),

                    Positioned(
                      top: skillsOffset.dy,
                      left: skillsOffset.dx,
                      child: const SkillsWidget(),
                    ),
                    
                    Positioned(
                      top: servicesOffset.dy,
                      left: servicesOffset.dx,
                      child: const ServicesWidget(),
                    ),
                  ],
                ),
              ),

              // Custom cursor overlay
              AnimatedPositioned(
                duration: const Duration(milliseconds: 40),
                top: pointer.dy - 10,
                left: pointer.dx - 10,
                child: CustomCursorWidget(
                  isClicked: isClicked,
                  shouldHide: shouldHide,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
}

