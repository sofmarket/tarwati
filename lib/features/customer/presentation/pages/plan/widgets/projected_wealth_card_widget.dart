import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/widgets/plan_wealth_chart_painter.dart';

class ProjectedWealthCardWidget extends StatelessWidget {
  const ProjectedWealthCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            context.colors.primary,
            context.colors.primaryLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projected Wealth',
                      style: TextStyle(
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w500,
                        color: context.colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                    8.gapH,
                    Text(
                      '\$1,252,360',
                      style: TextStyle(
                        fontSize: 28.spMin,
                        fontWeight: FontWeight.w800,
                        color: context.colors.white,
                        height: 1.1,
                      ),
                    ),
                    4.gapH,
                    Text(
                      'in 15 years',
                      style: TextStyle(
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w500,
                        color: context.colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 130.w,
                height: 72.h,
                child: CustomPaint(
                  painter: PlanWealthChartPainter(
                    lineColor: context.colors.white,
                    fillColor: context.colors.white.withValues(alpha: 0.15),
                  ),
                ),
              ),
            ],
          ),
          16.gapH,
          Text(
            'Your plan is balanced and on track to help you achieve financial freedom.',
            style: TextStyle(
              fontSize: 12.spMin,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: context.colors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
