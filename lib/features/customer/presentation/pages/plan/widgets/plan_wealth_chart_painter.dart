import 'package:flutter/material.dart';

class PlanWealthChartPainter extends CustomPainter {
  PlanWealthChartPainter({required this.lineColor, required this.fillColor});

  final Color lineColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      Offset(0, size.height * 0.78),
      Offset(size.width * 0.12, size.height * 0.72),
      Offset(size.width * 0.24, size.height * 0.82),
      Offset(size.width * 0.36, size.height * 0.58),
      Offset(size.width * 0.48, size.height * 0.62),
      Offset(size.width * 0.60, size.height * 0.42),
      Offset(size.width * 0.72, size.height * 0.48),
      Offset(size.width * 0.84, size.height * 0.28),
      Offset(size.width, size.height * 0.18),
    ];

    final fillPath = Path()
      ..moveTo(points.first.dx, size.height)
      ..lineTo(points.first.dx, points.first.dy);

    for (var i = 1; i < points.length; i++) {
      fillPath.lineTo(points[i].dx, points[i].dy);
    }

    fillPath
      ..lineTo(points.last.dx, size.height)
      ..close();

    canvas.drawPath(fillPath, Paint()..color = fillColor);

    final linePath = Path()
      ..moveTo(points.first.dx, points.first.dy);

    for (var i = 1; i < points.length; i++) {
      linePath.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(
      linePath,
      Paint()
        ..color = lineColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    final last = points.last;
    canvas.drawCircle(last, 4, Paint()..color = lineColor);
    canvas.drawCircle(
      last,
      7,
      Paint()
        ..color = lineColor.withValues(alpha: 0.25)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant PlanWealthChartPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.fillColor != fillColor;
  }
}
