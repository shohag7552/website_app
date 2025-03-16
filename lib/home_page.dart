import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

 double dotSpacing = 20.0;

  final TransformationController _transformationController = TransformationController();
  double zoomLevel = 1.0;
  Offset pointer = Offset.zero;
  bool isClicked = false;
  bool shouldHide = false;

  //for animation
  Offset _cursorPosition = Offset.zero;
  Offset _animatedCursorPosition = Offset.zero;
  List<Offset> _trailingPoints = [];
  Timer? _trailTimer;

  void _resetView() {
    _transformationController.value = Matrix4.identity(); // Reset to original position
  }

@override
  void initState() {
    super.initState();

    _startTrailingEffect();
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
    _trailTimer?.cancel();
    super.dispose();
  }

  // This function adds a trail effect by storing recent cursor positions
  void _startTrailingEffect() {
    _trailTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _trailingPoints.add(_cursorPosition);
        if (_trailingPoints.length > 10) {
          _trailingPoints.removeAt(0);
        }
      });
    });
  }

  void _onHover(PointerHoverEvent event) {
    setState(() {
      _cursorPosition = event.localPosition;
      _animatedCursorPosition = Offset.lerp(_animatedCursorPosition, _cursorPosition, 0.3)!;
    });
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
        onHover: _onHover,
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

              IgnorePointer(
                child: Stack(
                  children: [

                    // Cursor Trail Effect

                    for (int i = 0; i < _trailingPoints.length; i++)
                      Positioned(
                        top: _trailingPoints[i].dy - 10,
                        left: _trailingPoints[i].dx - 10,
                        child: Opacity(
                          opacity: (1 - (i / _trailingPoints.length)),
                          child: Builder(
                            builder: (context) {
                              return Container(
                                height: 20 * (1 - (i / _trailingPoints.length)),
                                width: 20 * (1 - (i / _trailingPoints.length)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                // child: Container(
                                //   height: 5, width: 5,
                                //   decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     color: Colors.redAccent.withOpacity(0.5),
                                //   ),
                                // ),
                              );
                            }
                          ),
                        ),
                      ),

                    // Custom cursor overlay
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 40),
                      top: _animatedCursorPosition.dy - 15,
                      left: _animatedCursorPosition.dx - 15,
                      // top: pointer.dy - 10,
                      // left: pointer.dx - 10,
                      child: CustomCursorWidget(
                        isClicked: isClicked,
                        shouldHide: shouldHide,
                      ),
                    ),

                  ],
                ),
              ),
            
          
              // Animated Cursor
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 50),
            //   top: _animatedCursorPosition.dy - 15,
            //   left: _animatedCursorPosition.dx - 15,
            //   child: CustomCursor(isClicked: _isClicked),
            // ),
          
          
            ],
          ),
        ),
      ),
    ),
    );
  }
}
