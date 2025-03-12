import 'package:flutter/material.dart';

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
    double dotSpacing = 30.0 / zoomLevel; // Adjust dot spacing based on zoom level
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