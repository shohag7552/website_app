import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website_app/const/dimentions.dart';
import 'package:website_app/tasks/about_widget.dart';
import 'package:website_app/components/custom_cursor_widget.dart';
import 'package:website_app/components/doted_background_painter.dart';
import 'package:website_app/components/lines_painter.dart';
import 'package:website_app/tasks/animated_food_widget.dart';
import 'package:website_app/tasks/build_new_widget.dart';
import 'package:website_app/tasks/growfresh_widget.dart';
import 'package:website_app/tasks/header_widget.dart';
import 'package:website_app/tasks/improve_existing_widget.dart';
import 'package:website_app/tasks/note_app_widget.dart';
import 'package:website_app/tasks/project_stackfood_widget.dart';
import 'package:website_app/tasks/project_6ammart_widget.dart';
import 'package:website_app/tasks/protfolio_website_widget.dart';
import 'package:website_app/tasks/services_widget.dart';
import 'package:website_app/tasks/skills_widget.dart';
import 'package:website_app/tasks/what_you_need_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

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

  final GlobalKey _aboutKey = GlobalKey(); 
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _serviceKey = GlobalKey();

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

    Offset aboutOffset = Offset(width*0.39, 390);

    Offset skillsOffset = Offset(width*0.25, 60);

    Offset servicesOffset = Offset(width*0.55, 60);

    Offset projectMartOffset = Offset(width*0.33, 1100);

    Offset projectStackfoodOffset = Offset(width*0.55, 1100);

    Offset buildNewOffset = Offset(width*0.3, 550);

    Offset improveExistingOffset = Offset(width*0.58, 550);

    Offset whatYouNeedOffset = Offset(width*0.37, 750);

    Offset noteAppOffset = Offset(width*0.85, 550);

    Offset protfolioOffset = Offset(width*0.85, 900);

    Offset animatedFoodOffset = Offset(width*0.67, 800);

    Offset growfreshOffset = Offset(width*0.1, 550);


    return LayoutBuilder(
      builder: (context, constraints) {
        print('========width: ${constraints.maxWidth}, height: ${constraints.maxHeight}');

        bool webView = constraints.maxWidth > 1090;
        bool tabletView = constraints.maxWidth > 600 && constraints.maxWidth < 1090;
        bool mobileView = constraints.maxWidth < 700;
        print('webView: $webView, tabletView: $tabletView, mobileView: $mobileView');

        if(mobileView) {
          skillsOffset = Offset(width*0.1, 60);
          servicesOffset = Offset(width*0.3, 350);
          aboutOffset = Offset(width*0.25, 600);
          buildNewOffset = Offset(width*0.02, 800);
          improveExistingOffset = Offset(width*0.53, 800);
          whatYouNeedOffset = Offset(width*0.2, 1000);
          projectMartOffset = Offset(width*0.1, 1350);
          projectStackfoodOffset = Offset(width*0.6, 1350);
          
          noteAppOffset = Offset(width*0.1, 1700);
          protfolioOffset = Offset(width*0.6, 1700);
          animatedFoodOffset = Offset(width*0.1, 2200);
          growfreshOffset = Offset(width*0.6, 2200);
        }

        return Scaffold(
          appBar: webView ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: HeaderWidget(aboutKey: _aboutKey, servicesKey: _serviceKey, contactKey: _contactKey, transformationController: _transformationController),
            ) : AppBar(
              title: const Text('My Website'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          body: MouseRegion(
            cursor: webView ? SystemMouseCursors.none : MouseCursor.defer, // Hide system cursor
            onHover: webView ? _onHover : null,
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
              minScale: 0.01,
              maxScale: 4.0,
              transformationController: _transformationController,
              child: Stack(
                children: [
                  CustomPaint(
                    // size: Size(2000, 1500),
                    painter: DottedBackgroundPainter(backgroundColor: Dimentions.backgroundColor, zoomLevel: zoomLevel),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: webView ? 2000 : 1000,
                          height: webView ? 1500 : 3000,
                          child: Stack(
                            children: [
                          
                              Builder(
                                builder: (context) {
                                  print('=====checkkkkk> ${constraints.maxWidth}, ${constraints.maxHeight}');
                                  return CustomPaint(
                                    // size: Size(width, height),
                                    size: Size(constraints.maxWidth, 1500),
                                    // size: webView ? Size(1500, 1500) : Size(1000, 3000), // Set the size of the canvas
                                    painter: webView ? LinePainter() : MobileLinePainter(),
                                  );
                                }
                              ),
                          
                              Positioned(
                                top: skillsOffset.dy,
                                left: skillsOffset.dx,
                                child: const SkillsWidget(),
                              ),
                              
                              Positioned(
                                top: servicesOffset.dy,
                                left: servicesOffset.dx,
                                child: ServicesWidget(key: _serviceKey),
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
                                // key: _aboutKey,
                                top: aboutOffset.dy,
                                left: aboutOffset.dx,
                                child: AboutWidget(key: _aboutKey,),
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
                                child: WhatYouNeedWidget(key: _contactKey),
                              ),
                                  
                              Positioned(
                                top: noteAppOffset.dy,
                                left: noteAppOffset.dx,
                                child: const NoteAppWidget(),
                              ),
                                  
                              Positioned(
                                top: protfolioOffset.dy,
                                left: protfolioOffset.dx,
                                child: const ProtfolioWebsiteWidget(),
                              ),
                                  
                              Positioned(
                                top: animatedFoodOffset.dy,
                                left: animatedFoodOffset.dx,
                                child: const AnimatedFoodWidget(),
                              ),
                                  
                              Positioned(
                                top: growfreshOffset.dy,
                                left: growfreshOffset.dx,
                                child: const GrowfreshWidget(),
                              ),
                                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
        
                 if(webView)
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
    );
  }
}
