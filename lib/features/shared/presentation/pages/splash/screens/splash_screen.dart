import 'package:flutter/material.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/app_icon_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/stars_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 66),
      body: Stack(
        children: [
          // Background star particles
          const StarsWidget(),

          // Main content
          SizedBox(
            width: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  60.gapH,

                  // App Icon
                  AppIconWidget(),

                  6.gapH,

                  // App Name
                  Column(
                    children: [
                      const Text(
                        'Tarwati',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      2.gapH,
                      Text(
                        'Your AI Financial Advisor',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                      ),
                    ],
                  ),

                  88.gapH,

                  GlassCardWidget(),

                  const Spacer(),

                  // Tagline
                  Column(
                    children: [
                      const Text(
                        'Your money. Your goals.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: -0.2,
                        ),
                      ),
                      6.gapH,
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.2,
                          ),
                          children: [
                            TextSpan(
                              text: 'Our AI. ',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                            ),
                            const TextSpan(
                              text: 'Your freedom.',
                              style: TextStyle(color: Color(0xFF7B7BFF)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  28.gapH,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Glass Card with Platform ──────────────────────────────────────────────────

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4A4AFF).withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bullet points
          _BulletText('Smart plans'),
          const SizedBox(height: 6),
          _BulletText('Better decisions'),
          const SizedBox(height: 6),
          _BulletText('Stronger future'),
          const SizedBox(height: 20),

          // Mini chart inside card
          SizedBox(
            height: 60,
            child: CustomPaint(
              painter: _MiniChartPainter(progress: 0.5),
              size: const Size(double.infinity, 60),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;
  const _BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            color: Color(0xFF8080FF),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _MiniChartPainter extends CustomPainter {
  final double progress;
  const _MiniChartPainter({required this.progress});

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
          const Color(0xFF6A6AFF).withOpacity(0.35),
          const Color(0xFF6A6AFF).withOpacity(0.0),
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
          ..color = Colors.white.withOpacity(0.2)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MiniChartPainter old) =>
      old.progress != progress;
}
