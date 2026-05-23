import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class AiAdvisorCardWidget extends StatelessWidget {
  const AiAdvisorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 12.w, 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          colors: [
            context.colors.primary,
            context.colors.primaryLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your AI Financial Advisor',
                  style: TextStyle(
                    fontSize: 12.r,
                    fontWeight: FontWeight.w500,
                    color: context.colors.white.withValues(alpha: 0.85),
                  ),
                ),
                8.gapH,
                Text(
                  'Smart advice.\nBetter future.',
                  style: TextStyle(
                    fontSize: 18.r,
                    fontWeight: FontWeight.w800,
                    color: context.colors.white,
                    height: 1.2,
                  ),
                ),
                8.gapH,
                Text(
                  'Personalized plans, expert insights, real results.',
                  style: TextStyle(
                    fontSize: 11.r,
                    fontWeight: FontWeight.w400,
                    color: context.colors.white.withValues(alpha: 0.85),
                    height: 1.4,
                  ),
                ),
                16.gapH,
                Material(
                  color: context.colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(24.r),
                    child: Ink(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Generate My Plan',
                            style: TextStyle(
                              fontSize: 13.r,
                              fontWeight: FontWeight.w700,
                              color: context.colors.primary,
                            ),
                          ),
                          6.gapW,
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 16.r,
                            color: context.colors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          8.gapW,
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -8.h,
                right: 12.w,
                child: Icon(
                  Icons.auto_awesome,
                  size: 14.r,
                  color: context.colors.white.withValues(alpha: 0.7),
                ),
              ),
              Positioned(
                bottom: 20.h,
                left: -4.w,
                child: Icon(
                  Icons.auto_awesome,
                  size: 10.r,
                  color: context.colors.white.withValues(alpha: 0.5),
                ),
              ),
              Image.asset(
                'assets/images/robot.png',
                width: 110.w,
                height: 130.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
