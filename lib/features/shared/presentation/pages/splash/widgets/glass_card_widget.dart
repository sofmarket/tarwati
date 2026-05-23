import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/mini_chart_painter.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colors.white.withValues(alpha: 0.08),
        border: Border.all(
          color: context.colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colors.primaryLight.withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bullet points
          BulletTextWidget(text: 'Smart plans'),
          6.gapH,
          BulletTextWidget(text: 'Better decisions'),
          6.gapH,
          BulletTextWidget(text: 'Stronger future'),
          20.gapH,
          // Mini chart inside card
          SizedBox(
            height: 60,
            width: double.infinity,
            child: CustomPaint(
              painter: MiniChartPainter(progress: .95.r, colors: context.colors),
              size: Size(double.infinity, 60),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletTextWidget extends StatelessWidget {
  final String text;
  const BulletTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8.r,
          height: 8.r,
          decoration: BoxDecoration(
            color: context.colors.primaryLight,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: context.colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
