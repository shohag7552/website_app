import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        // boundaryMargin: EdgeInsets.all(20),
        minScale: 0.5,
        maxScale: 3.0,
        onInteractionUpdate: (details) {
          print('Scale: ${details.scale}');
        },
        child: CustomPaint(
          painter: DottedBackgroundPainter(backgroundColor: Colors.black),
          child: Center(
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

  DottedBackgroundPainter({this.backgroundColor})
      : _backgroundPaint = Paint()..color = backgroundColor ?? Colors.transparent,
        _dotPaint = Paint()
          ..color = Colors.white
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
    const double dotSpacing = 20.0; // Spacing between dots
    const double dotSize = 2.0; // Dot size

    for (double y = 0; y < size.height; y += dotSpacing) {
      for (double x = 0; x < size.width; x += dotSpacing) {
        canvas.drawCircle(Offset(x, y), dotSize, _dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}