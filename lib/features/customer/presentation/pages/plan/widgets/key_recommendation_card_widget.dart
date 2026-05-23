import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class KeyRecommendationCardWidget extends StatelessWidget {
  const KeyRecommendationCardWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Ink(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: context.colors.success.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flight_takeoff_rounded,
                    size: 18.r,
                    color: context.colors.successDarker,
                  ),
                  8.gapW,
                  Text(
                    'Key Recommendation',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w700,
                      color: context.colors.successDarker,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20.r,
                    color: context.colors.textTertiary,
                  ),
                ],
              ),
              10.gapH,
              Text(
                'Increase your emergency fund to 6 months of expenses.',
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: context.colors.textSecondary,
                ),
              ),
              12.gapH,
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See How',
                      style: TextStyle(
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w600,
                        color: context.colors.successDarker,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 18.r,
                      color: context.colors.successDarker,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
