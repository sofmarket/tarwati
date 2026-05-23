import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class GoalsProgressHeaderWidget extends StatelessWidget {
  const GoalsProgressHeaderWidget({
    super.key,
    this.currentStep = 2,
    this.totalSteps = 4,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4.h,
            backgroundColor: context.colors.grey250,
            color: context.colors.primary,
          ),
        ),
        24.gapH,
        Text(
          'What are you working towards?',
          style: TextStyle(
            fontSize: 15.spMin,
            fontWeight: FontWeight.w600,
            color: context.colors.textSecondary,
          ),
        ),
        6.gapH,
        Text(
          'We\'ll build a plan to help you get there.',
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w400,
            color: context.colors.textTertiary,
          ),
        ),
      ],
    );
  }
}
