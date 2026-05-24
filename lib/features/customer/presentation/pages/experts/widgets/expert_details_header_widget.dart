import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/models/expert_model.dart';
import 'package:tarwati/gen/assets.gen.dart';

class ExpertDetailsHeaderWidget extends StatelessWidget {
  const ExpertDetailsHeaderWidget({
    super.key,
    required this.expert,
  });

  final ExpertModel expert;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colors.primaryDarkest,
            context.colors.secondary,
            context.colors.primaryDarker,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: SvgPicture.asset(
                      Assets.icons.chevronLeft,
                      width: 24.r,
                      height: 24.r,
                      colorFilter: ColorFilter.mode(
                        context.colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.icons.menuVertical,
                      width: 24.r,
                      height: 24.r,
                      colorFilter: ColorFilter.mode(
                        context.colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.asset(
                        expert.imagePath,
                        width: 80.w,
                        height: 80.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    14.gapW,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (expert.isOnline)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 3.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.success,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                'Online',
                                style: TextStyle(
                                  fontSize: 11.spMin,
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.white,
                                ),
                              ),
                            ),
                          6.gapH,
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  expert.name,
                                  style: TextStyle(
                                    fontSize: 18.spMin,
                                    fontWeight: FontWeight.w700,
                                    color: context.colors.white,
                                  ),
                                ),
                              ),
                              4.gapW,
                              Icon(
                                Icons.verified_rounded,
                                size: 18.r,
                                color: context.colors.primaryLight,
                              ),
                            ],
                          ),
                          4.gapH,
                          Text(
                            expert.title,
                            style: TextStyle(
                              fontSize: 13.spMin,
                              fontWeight: FontWeight.w400,
                              color: context.colors.white.withValues(
                                alpha: 0.85,
                              ),
                            ),
                          ),
                          2.gapH,
                          Text(
                            '${expert.yearsExperience}+ years experience',
                            style: TextStyle(
                              fontSize: 13.spMin,
                              fontWeight: FontWeight.w400,
                              color: context.colors.white.withValues(
                                alpha: 0.85,
                              ),
                            ),
                          ),
                          6.gapH,
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 16.r,
                                color: context.colors.yellow,
                              ),
                              4.gapW,
                              Text(
                                '${expert.rating} (${expert.reviewCount} reviews)',
                                style: TextStyle(
                                  fontSize: 13.spMin,
                                  fontWeight: FontWeight.w500,
                                  color: context.colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              16.gapH,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: expert.tags
                      .map(
                        (tag) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 12.spMin,
                              fontWeight: FontWeight.w500,
                              color: context.colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
