import 'package:flutter/material.dart';
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
   
    // Define points for the lines
    List<List<Offset>> lines = [
      [Offset(size.width*0.4, size.height * 0.1), Offset(size.width*0.6, size.height * 0.1)], //Top horizontal line
      [Offset(size.width / 2, size.height * 0.1), Offset(size.width / 2, size.height * 0.9)], // Main vertical line
      [Offset(size.width / 2, size.height * 0.25), Offset(size.width * 0.2, size.height * 0.25)], // Left horizontal line
      [Offset(size.width * 0.2, size.height * 0.15), Offset(size.width * 0.2, size.height * 0.37)], // Left vertical line
      [Offset(size.width / 2, size.height * 0.25), Offset(size.width * 0.8, size.height * 0.25)], // Right horizontal line
      [Offset(size.width * 0.8, size.height * 0.25), Offset(size.width * 0.8, size.height * 0.95)], // Right vertical line
      [Offset(size.width / 2, size.height * 0.45), Offset(size.width * 0.45, size.height * 0.45)], // Smaller left horizontal line
      [Offset(size.width / 2, size.height * 0.45), Offset(size.width * 0.6, size.height * 0.45)], // Smaller right horizontal line
      [Offset(size.width / 2, size.height * 0.7), Offset(size.width * 0.35, size.height * 0.7)], // Another left horizontal line
      [Offset(size.width / 2, size.height * 0.75), Offset(size.width * 0.55, size.height * 0.75)], // Another right horizontal line
      [Offset(size.width * 0.4, size.height * 0.9), Offset(size.width / 2, size.height * 0.9)], // Another vertical line
    ];

    // Draw lines
    for (var line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }

    // Draw Text labels
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    _drawText(canvas, textPainter, "PLAYGROUND", Offset(size.width * 0.15, size.height * 0.18));
    _drawText(canvas, textPainter, "EXPERIENCE", Offset(size.width * 0.75, size.height * 0.18));
    _drawText(canvas, textPainter, "SKILLS", Offset(size.width * 0.48, size.height * 0.05));
    _drawText(canvas, textPainter, "TOOLS USED", Offset(size.width * 0.48, size.height * 0.35));
    _drawText(canvas, textPainter, "MORE DETAILS", Offset(size.width * 0.48, size.height * 0.75));
  }

  void _drawText(Canvas canvas, TextPainter textPainter, String text, Offset position) {
    textPainter.text = TextSpan(
      text: text,
      style: const TextStyle(color: Colors.black, fontSize: 12),
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}