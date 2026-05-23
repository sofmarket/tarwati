import 'package:flutter/material.dart';
import 'package:tarwati/core/theming/colors.dart';

class MiniChartPainter extends CustomPainter {
  final double progress;
  MiniChartPainter({required this.progress, required this.colors});
  final AppColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      Offset(0, size.height * 0.75),
      Offset(size.width * 0.15, size.height * 0.65),
      Offset(size.width * 0.28, size.height * 0.80),
      Offset(size.width * 0.42, size.height * 0.55),
      Offset(size.width * 0.55, size.height * 0.45),
      Offset(size.width * 0.68, size.height * 0.30),
      Offset(size.width * 0.82, size.height * 0.20),
      Offset(size.width, size.height * 0.05),
    ];

    final drawCount = (points.length * progress).ceil().clamp(2, points.length);
    final drawnPoints = points.sublist(0, drawCount);

    // Fill area
    final fillPath = Path();
    fillPath.moveTo(drawnPoints.first.dx, size.height);
    for (final p in drawnPoints) {
      fillPath.lineTo(p.dx, p.dy);
    }
    fillPath.lineTo(drawnPoints.last.dx, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colors.primaryLight.withValues(alpha: 0.35),
          colors.primaryLight.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);

    // Line
    final linePath = Path();
    linePath.moveTo(drawnPoints.first.dx, drawnPoints.first.dy);
    for (int i = 1; i < drawnPoints.length; i++) {
      linePath.lineTo(drawnPoints[i].dx, drawnPoints[i].dy);
    }

    final linePaint = Paint()
      ..color = const Color(0xFF8888FF)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(linePath, linePaint);

    // Dot at end
    if (drawnPoints.isNotEmpty) {
      final last = drawnPoints.last;
      canvas.drawCircle(last, 3.5, Paint()..color = Colors.white);
      canvas.drawCircle(
        last,
        6,
        Paint()
          ..color = colors.white.withValues(alpha: 0.2)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant MiniChartPainter old) =>
      old.progress != progress;
}