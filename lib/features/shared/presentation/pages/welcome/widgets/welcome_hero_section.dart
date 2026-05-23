import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/features/shared/presentation/pages/welcome/widgets/welcome_feature_card.dart';

class WelcomeHeroSection extends StatelessWidget {
  const WelcomeHeroSection({super.key});

  static const _features = [
    _FeatureData(Icons.pie_chart_rounded, 'Smart\nAnalysis', 240),
    _FeatureData(Icons.track_changes_rounded, 'Personalized\nPlans', 300),
    _FeatureData(Icons.person_outline_rounded, 'Expert\nAdvice', 180),
    _FeatureData(Icons.bar_chart_rounded, 'Real-time\nInsights', 0),
    _FeatureData(Icons.emoji_events_outlined, 'Achieve Your\nGoals', 90),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.r,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
          final radius = constraints.maxWidth * 0.42;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: _CirclePathPainter(
                  center: center,
                  radius: radius,
                  color: context.colors.primary.withValues(alpha: 0.12),
                ),
              ),
              Positioned(
                left: center.dx - 72.w,
                top: center.dy - 90.h,
                child: Image.asset(
                  'assets/images/robot.png',
                  width: 144.w,
                  height: 180.h,
                  fit: BoxFit.contain,
                ),
              ),
              for (final feature in _features)
                _positionedCard(
                  center: center,
                  radius: radius,
                  angleDegrees: feature.angle,
                  child: WelcomeFeatureCard(
                    icon: feature.icon,
                    label: feature.label,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _positionedCard({
    required Offset center,
    required double radius,
    required double angleDegrees,
    required Widget child,
  }) {
    final radians = angleDegrees * math.pi / 180;
    final cardCenter = Offset(
      center.dx + radius * math.cos(radians),
      center.dy + radius * math.sin(radians),
    );

    return Positioned(
      left: cardCenter.dx - 38.w,
      top: cardCenter.dy - 36.h,
      child: child,
    );
  }
}

class _FeatureData {
  const _FeatureData(this.icon, this.label, this.angle);

  final IconData icon;
  final String label;
  final double angle;
}

class _CirclePathPainter extends CustomPainter {
  const _CirclePathPainter({
    required this.center,
    required this.radius,
    required this.color,
  });

  final Offset center;
  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _CirclePathPainter oldDelegate) {
    return oldDelegate.center != center ||
        oldDelegate.radius != radius ||
        oldDelegate.color != color;
  }
}
