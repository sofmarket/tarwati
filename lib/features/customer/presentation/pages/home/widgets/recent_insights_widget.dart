import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class RecentInsightsWidget extends StatelessWidget {
  const RecentInsightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Insights',
          style: TextStyle(
            fontSize: 18.spMin,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        14.gapH,
        Material(
          color: context.colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16.r),
            child: Ink(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: context.colors.grey50,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      color: context.colors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.auto_awesome,
                      size: 20.r,
                      color: context.colors.primary,
                    ),
                  ),
                  12.gapW,
                  Expanded(
                    child: Text(
                      'You can save an extra \$320/month by optimizing subscriptions.',
                      style: TextStyle(
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w500,
                        color: context.colors.textPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 22.r,
                    color: context.colors.grey400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
