import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/theming/colors.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class FinancialHealthCardWidget extends StatelessWidget {
  const FinancialHealthCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Financial Health',
                style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w700,
                  color: context.colors.textPrimary,
                ),
              ),
              6.gapW,
              Icon(
                Icons.info_outline_rounded,
                size: 16.r,
                color: context.colors.textTertiary,
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: context.colors.success.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Good',
                  style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w600,
                    color: context.colors.successDarker,
                  ),
                ),
              ),
            ],
          ),
          20.gapH,
          Row(
            children: [
              _HealthScoreRing(score: 72, colors: context.colors),
              20.gapW,
              Expanded(
                child: Column(
                  children: [
                    _HealthMetricRow(
                      icon: Icons.trending_up_rounded,
                      iconColor: context.colors.success,
                      title: 'Cash Flow',
                      status: 'Good',
                      statusColor: context.colors.successDarker,
                    ),
                    14.gapH,
                    _HealthMetricRow(
                      icon: Icons.savings_outlined,
                      iconColor: context.colors.primaryLight,
                      title: 'Savings Rate',
                      status: 'On Track',
                      statusColor: context.colors.textSecondary,
                    ),
                    14.gapH,
                    _HealthMetricRow(
                      icon: Icons.warning_amber_rounded,
                      iconColor: context.colors.warning,
                      title: 'Debt Management',
                      status: 'Needs Attention',
                      statusColor: context.colors.warning,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HealthScoreRing extends StatelessWidget {
  const _HealthScoreRing({required this.score, required this.colors});

  final int score;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.r,
      height: 110.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              padding: EdgeInsets.all(8.w),
              value: score / 100,
              backgroundColor: colors.grey150,
              valueColor: AlwaysStoppedAnimation(colors.primaryLight),
              strokeWidth: 8,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 28.spMin,
                  fontWeight: FontWeight.w800,
                  color: colors.textPrimary,
                  height: 1,
                ),
              ),
              Text(
                '/100',
                style: TextStyle(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w500,
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HealthMetricRow extends StatelessWidget {
  const _HealthMetricRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.status,
    required this.statusColor,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32.r,
          height: 32.r,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, size: 18.r, color: iconColor),
        ),
        10.gapW,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textPrimary,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
