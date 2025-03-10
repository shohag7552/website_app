import 'package:flutter/material.dart';
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
    print('zoomLevel: $zoomLevel');

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
          // boundaryMargin: EdgeInsets.all(20),
          minScale: 0.1,
          maxScale: 5.0,
          transformationController: _transformationController,
          child: Stack(
            children: [
              CustomPaint(
                painter: DottedBackgroundPainter(backgroundColor: Colors.grey, zoomLevel: zoomLevel),
                child: Center(
                  child: InkWell(
                    onTap: _resetView,
                    child: Text(
                      'Hello, Flutter!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: pointer.dx - 10,
                top: pointer.dy - 10,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: isClicked ? 15 : 20,
                  height: isClicked ? 15 : 20,
                  decoration: BoxDecoration(
                    color: isClicked ? Colors.red : Colors.blue,
                    shape: BoxShape.circle,
                  ),
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

class DottedBackgroundPainter extends CustomPainter {
  final Color? backgroundColor;
  final Paint _backgroundPaint;
  final Paint _dotPaint;
  final double zoomLevel;

  DottedBackgroundPainter({this.backgroundColor, required this.zoomLevel})
      : _backgroundPaint = Paint()..color = backgroundColor ?? Colors.transparent,
        _dotPaint = Paint()
          ..color = Colors.black45
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background color
    if (backgroundColor != null) {
      final rect = Rect.fromLTWH(0, 0, size.width, size.height);
      canvas.drawRect(rect, _backgroundPaint);
    }

    // Draw dots pattern
    _drawDots(canvas, size);
  }

  void _drawDots(Canvas canvas, Size size) {
    // const double dotSpacing = 20.0; // Spacing between dots
    // const double dotSize = 1.0; // Dot size
    double dotSpacing = 20.0 / zoomLevel; // Adjust dot spacing based on zoom level
    double dotSize = 1.0 / zoomLevel; // Adjust dot size based on zoom level


    for (double y = 0; y < size.height; y += dotSpacing) {
      for (double x = 0; x < size.width; x += dotSpacing) {
        canvas.drawCircle(Offset(x, y), dotSize, _dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}