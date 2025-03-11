import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:website_app/const/dimentions.dart';
class CustomCursorWidget extends StatelessWidget {
  final bool isClicked;
  final bool shouldHide;

  const CustomCursorWidget({
    super.key,
    required this.isClicked,
    required this.shouldHide,
  });

  final duration = const Duration(milliseconds: 50);

  @override
  Widget build(BuildContext context) {
    double size = Dimentions.cursorSize;
    var actualDuration = duration;

    if (shouldHide) {
      size = 0;
      actualDuration = const Duration(milliseconds: 200);
    } else if (isClicked) {
      size = Dimentions.smallCursorSize;
    }

    return NoHitboxWidget(
      child: AnimatedContainer(
        duration: actualDuration,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.accents.last,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blueGrey.shade900,
            width: 2,
          ),
        ),
      ),
    );
  }
}

// Widget to prevent cursor from interacting with UI elements
class NoHitboxWidget extends SingleChildRenderObjectWidget {
  const NoHitboxWidget({super.key, required Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _SmallerHitBoxRenderObject();
  }
}

class _SmallerHitBoxRenderObject extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return false;
  }
}