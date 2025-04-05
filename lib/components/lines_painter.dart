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
      [Offset(size.width / 2, size.height * 0.3), Offset(size.width * 0.15, size.height * 0.3)], // Left horizontal line
      [Offset(size.width * 0.15, size.height * 0), Offset(size.width * 0.15, size.height * 0.37)], // Left vertical line
      [Offset(size.width / 2, size.height * 0.3), Offset(size.width * 0.8, size.height * 0.3)], // Right horizontal line
      [Offset(size.width * 0.8, size.height * 0.3), Offset(size.width * 0.8, size.height * 0.95)], // Right vertical line
      [Offset(size.width / 2, size.height * 0.40), Offset(size.width * 0.30, size.height * 0.40)], // Smaller left horizontal line
      [Offset(size.width / 2, size.height * 0.40), Offset(size.width * 0.6, size.height * 0.40)], // Smaller right horizontal line
      [Offset(size.width / 2, size.height * 0.75), Offset(size.width * 0.35, size.height * 0.75)], // Another left horizontal line
      [Offset(size.width / 2, size.height * 0.75), Offset(size.width * 0.55, size.height * 0.75)], // Another right horizontal line
      [Offset(size.width * 0.4, size.height * 0.9), Offset(size.width / 2, size.height * 0.9)], // Another vertical line
      [Offset(size.width * 0.8, size.height * 0.4), Offset(size.width * 0.9, size.height * 0.4)], // Right vertical line's right horizontal line
      [Offset(size.width * 0.75, size.height * 0.56), Offset(size.width * 0.8, size.height * 0.56)], // Right vertical line's left horizontal line
      [Offset(size.width * 0.8, size.height * 0.65), Offset(size.width * 0.9, size.height * 0.65)], // Right vertical line's vertical line

    ];

    // Draw lines
    for (var line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }

    // Draw dot (red)
    Paint dotPaint = Paint()..color = Colors.black;

    List<Offset> dots = [
      Offset(size.width / 2, size.height * 0.1),
      Offset(size.width / 2, size.height * 0.3),
      Offset(size.width * 0.15, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.3),
      Offset(size.width / 2, size.height * 0.40),
      Offset(size.width * 0.8, size.height * 0.95),
      Offset(size.width / 2, size.height * 0.7),
      Offset(size.width / 2, size.height * 0.75),
      Offset(size.width / 2, size.height * 0.9),
    ];

    for (var dot in dots) {
      canvas.drawCircle(dot, 3, dotPaint);
    }

    // canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 5, dotPaint);

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

class MobileLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
   
    // Define points for the lines
    List<List<Offset>> lines = [
      // [Offset(size.width*0.4, size.height * 0.1), Offset(size.width*0.6, size.height * 0.1)], //Top horizontal line
      [Offset(size.width / 2, size.height * 0.1), Offset(size.width / 2, size.height * 0.9)], // Main vertical line
      [Offset(size.width / 2, size.height * 0.3), Offset(size.width * 0.15, size.height * 0.3)], // Left horizontal line
      [Offset(size.width * 0.15, size.height * 0), Offset(size.width * 0.15, size.height * 0.37)], // Left vertical line
      [Offset(size.width / 2, size.height * 0.3), Offset(size.width * 0.8, size.height * 0.3)], // Right horizontal line
      [Offset(size.width * 0.8, size.height * 0.3), Offset(size.width * 0.8, size.height * 0.95)], // Right vertical line
      [Offset(size.width / 2, size.height * 0.40), Offset(size.width * 0.30, size.height * 0.40)], // Smaller left horizontal line
      [Offset(size.width / 2, size.height * 0.40), Offset(size.width * 0.6, size.height * 0.40)], // Smaller right horizontal line
      [Offset(size.width / 2, size.height * 0.75), Offset(size.width * 0.35, size.height * 0.75)], // Another left horizontal line
      [Offset(size.width / 2, size.height * 0.75), Offset(size.width * 0.55, size.height * 0.75)], // Another right horizontal line
      [Offset(size.width * 0.4, size.height * 0.9), Offset(size.width / 2, size.height * 0.9)], // Another vertical line
      [Offset(size.width * 0.8, size.height * 0.4), Offset(size.width * 0.9, size.height * 0.4)], // Right vertical line's right horizontal line
      [Offset(size.width * 0.75, size.height * 0.56), Offset(size.width * 0.8, size.height * 0.56)], // Right vertical line's left horizontal line
      [Offset(size.width * 0.8, size.height * 0.65), Offset(size.width * 0.9, size.height * 0.65)], // Right vertical line's vertical line

    ];

    // Draw lines
    for (var line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }

    // Draw dot (red)
    // Paint dotPaint = Paint()..color = Colors.black;

    // List<Offset> dots = [
    //   Offset(size.width / 2, size.height * 0.1),
    //   Offset(size.width / 2, size.height * 0.3),
    //   Offset(size.width * 0.15, size.height * 0.3),
    //   Offset(size.width * 0.8, size.height * 0.3),
    //   Offset(size.width / 2, size.height * 0.40),
    //   Offset(size.width * 0.8, size.height * 0.95),
    //   Offset(size.width / 2, size.height * 0.7),
    //   Offset(size.width / 2, size.height * 0.75),
    //   Offset(size.width / 2, size.height * 0.9),
    // ];

    // for (var dot in dots) {
    //   canvas.drawCircle(dot, 3, dotPaint);
    // }

    // canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 5, dotPaint);

    // Draw Text labels
    // TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    // _drawText(canvas, textPainter, "PLAYGROUND", Offset(size.width * 0.15, size.height * 0.18));
    // _drawText(canvas, textPainter, "EXPERIENCE", Offset(size.width * 0.75, size.height * 0.18));
    // _drawText(canvas, textPainter, "SKILLS", Offset(size.width * 0.48, size.height * 0.05));
    // _drawText(canvas, textPainter, "TOOLS USED", Offset(size.width * 0.48, size.height * 0.35));
    // _drawText(canvas, textPainter, "MORE DETAILS", Offset(size.width * 0.48, size.height * 0.75));
  }

  // void _drawText(Canvas canvas, TextPainter textPainter, String text, Offset position) {
  //   textPainter.text = TextSpan(
  //     text: text,
  //     style: const TextStyle(color: Colors.black, fontSize: 12),
  //   );
  //   textPainter.layout();
  //   textPainter.paint(canvas, position);
  // }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}