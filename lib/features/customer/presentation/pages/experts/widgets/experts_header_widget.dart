import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class ExpertsHeaderWidget extends StatelessWidget {
  const ExpertsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Talk to real financial experts, anytime.',
                style: TextStyle(
                  fontSize: 20.spMin,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: context.colors.textPrimary,
                ),
              ),
              8.gapH,
              Text(
                'Book a 1-on-1 session and get personalized guidance.',
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        12.gapW,
        Image.asset(
          'assets/images/expert_service.png',
          width: 120.w,
          height: 100.h,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
