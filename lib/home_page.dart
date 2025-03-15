import 'package:flutter/material.dart';
import 'package:website_app/tasks/about_widget.dart';
import 'package:website_app/components/custom_cursor_widget.dart';
import 'package:website_app/components/doted_background_painter.dart';
import 'package:website_app/components/lines_painter.dart';
import 'package:website_app/tasks/build_new_widget.dart';
import 'package:website_app/tasks/improve_existing_widget.dart';
import 'package:website_app/tasks/project_stackfood_widget.dart';
import 'package:website_app/tasks/project_6ammart_widget.dart';
import 'package:website_app/tasks/services_widget.dart';
import 'package:website_app/tasks/skills_widget.dart';
import 'package:website_app/tasks/what_you_need_widget.dart';

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

    // Offset aboutOffset = Offset(width*0.39, height*0.18);
    Offset aboutOffset = Offset(width*0.39, 390);

    // Offset skillsOffset = Offset(width*0.35, height*0.05);
    Offset skillsOffset = Offset(width*0.25, 60);

    // Offset servicesOffset = Offset(width*0.15, height*0.1);
    Offset servicesOffset = Offset(width*0.55, 60);

    // Offset projectOffset = Offset(width*0.15, height*0.32);
    Offset projectMartOffset = Offset(width*0.35, 1000);

    Offset projectStackfoodOffset = Offset(width*0.55, 1100);

    // Offset buildNewOffset = Offset(width*0.3, height*0.4);
    Offset buildNewOffset = Offset(width*0.3, 550);

    // Offset improveExistingOffset = Offset(width*0.52, height*0.4);
    Offset improveExistingOffset = Offset(width*0.52, 550);

    // Offset whatYouNeedOffset = Offset(width*0.4, height*0.75);
    Offset whatYouNeedOffset = Offset(width*0.37, 800);


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
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                  
                      CustomPaint(
                        // size: Size(width, height),
                        size: Size(2000, 1500), // Set the size of the canvas
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
                  
                      Positioned(
                        top: projectMartOffset.dy,
                        left: projectMartOffset.dx,
                        child: const Project6amMartWidget(),
                      ),

                      Positioned(
                        top: projectStackfoodOffset.dy,
                        left: projectStackfoodOffset.dx,
                        child: const ProjectStackfoodWidget(),
                      ),
                  
                      Positioned(
                        top: aboutOffset.dy,
                        left: aboutOffset.dx,
                        child: const AboutWidget(),
                      ),

                      Positioned(
                        top: buildNewOffset.dy,
                        left: buildNewOffset.dx,
                        child: const BuildNewWidget(),
                      ),

                      Positioned(
                        top: improveExistingOffset.dy,
                        left: improveExistingOffset.dx,
                        child: const ImproveExistingWidget(),
                      ),

                      Positioned(
                        top: whatYouNeedOffset.dy,
                        left: whatYouNeedOffset.dx,
                        child: const WhatYouNeedWidget(),
                      ),

                    ],
                  ),
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

