import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/customer/presentation/pages/experts/models/expert_model.dart';

class ExpertCardWidget extends StatelessWidget {
  const ExpertCardWidget({
    super.key,
    required this.expert,
    this.onBookNow,
  });

  final ExpertModel expert;
  final VoidCallback? onBookNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.grey250,
          width: 1.r,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (expert.isOnline)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 10.r,
                height: 10.r,
                decoration: BoxDecoration(
                  color: context.colors.success,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colors.white,
                    width: 2.r,
                  ),
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  expert.imagePath,
                  width: 72.w,
                  height: 72.w,
                  fit: BoxFit.cover,
                ),
              ),
              12.gapW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expert.name,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w700,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    2.gapH,
                    Text(
                      expert.title,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w400,
                        color: context.colors.textSecondary,
                      ),
                    ),
                    8.gapH,
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 16.r,
                          color: context.colors.yellow,
                        ),
                        2.gapW,
                        Text(
                          '${expert.rating} (${expert.reviewCount})',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w500,
                            color: context.colors.textPrimary,
                          ),
                        ),
                        6.gapW,
                        Text(
                          '•',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            color: context.colors.textTertiary,
                          ),
                        ),
                        6.gapW,
                        Text(
                          '${expert.yearsExperience} years exp.',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    10.gapH,
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 6.h,
                      children: expert.tags
                          .map(
                            (tag) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.lightGray,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: context.colors.grey250,
                                  width: 1.r,
                                ),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 11.spMin,
                                  fontWeight: FontWeight.w500,
                                  color: context.colors.textSecondary,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    12.gapH,
                    Row(
                      children: [
                        Text(
                          '\$${expert.pricePerSession}',
                          style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w700,
                            color: context.colors.textPrimary,
                          ),
                        ),
                        Text(
                          ' / session',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            color: context.colors.textSecondary,
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: context.colors.transparent,
                          child: InkWell(
                            onTap: onBookNow,
                            borderRadius: BorderRadius.circular(10.r),
                            child: Ink(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.primary,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 12.spMin,
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
