import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class WelcomeFeatureCard extends StatelessWidget {
  const WelcomeFeatureCard({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: context.colors.primary,
            size: 22.r,
          ),
          6.gapH,
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.spMin,
              fontWeight: FontWeight.w600,
              color: context.colors.textPrimary,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
