import 'dart:math' as math;
import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: StarsWidgetPainter(), size: Size.infinite);
  }
}

class StarsWidgetPainter extends CustomPainter {
  static final List<Offset> _stars = List.generate(60, (i) {
    final r = math.Random(i * 7 + 13);
    return Offset(r.nextDouble(), r.nextDouble());
  });

  static final List<double> _sizes = List.generate(60, (i) {
    final r = math.Random(i * 3 + 7);
    return r.nextDouble() * 1.8 + 0.4;
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.4);
    for (int i = 0; i < _stars.length; i++) {
      canvas.drawCircle(
        Offset(_stars[i].dx * size.width, _stars[i].dy * size.height),
        _sizes[i],
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
