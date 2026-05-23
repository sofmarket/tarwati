import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/gen/assets.gen.dart';

class ExpertBannerWidget extends StatelessWidget {
  const ExpertBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            context.colors.primary.withValues(alpha: 0.85),
            context.colors.primaryLight,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 120.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connect with real financial experts for personalized guidance.',
                  style: TextStyle(
                    fontSize: 12.r,
                    fontWeight: FontWeight.w600,
                    color: context.colors.white,
                  ),
                ),
                16.gapH,
                Material(
                  color: context.colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20.r),
                    child: Ink(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Book a Session',
                            style: TextStyle(
                              fontSize: 12.spMin,
                              fontWeight: FontWeight.w700,
                              color: context.colors.primary,
                            ),
                          ),
                          4.gapW,
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 18.r,
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
          Positioned(
            right: 0,
            bottom: 0,
            child: Assets.images.expertsBanner.image(
              height: 120.h,
              fit: BoxFit.fitHeight,
              alignment: Alignment.bottomRight,
            ),
          ),
        ],
      ),
    );
  }
}