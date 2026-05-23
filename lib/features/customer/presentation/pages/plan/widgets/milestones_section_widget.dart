import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/models/plan_model.dart';

class MilestonesSectionWidget extends StatelessWidget {
  const MilestonesSectionWidget({
    super.key,
    required this.milestones,
    this.onSeeAll,
  });

  final List<PlanMilestoneItem> milestones;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Milestones',
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w700,
                color: context.colors.textPrimary,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 13.spMin,
                  fontWeight: FontWeight.w600,
                  color: context.colors.primary,
                ),
              ),
            ),
          ],
        ),
        14.gapH,
        ...List.generate(milestones.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == milestones.length - 1 ? 0 : 12.h,
            ),
            child: _MilestoneCard(milestone: milestones[index]),
          );
        }),
      ],
    );
  }
}

class _MilestoneCard extends StatelessWidget {
  const _MilestoneCard({required this.milestone});

  final PlanMilestoneItem milestone;

  @override
  Widget build(BuildContext context) {
    final progressPercent = (milestone.progress * 100).round();

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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: milestone.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  milestone.icon,
                  size: 22.r,
                  color: milestone.iconColor,
                ),
              ),
              12.gapW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      milestone.title,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w700,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    4.gapH,
                    Text(
                      'Target: ${milestone.targetDate}',
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w400,
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    milestone.amount,
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w700,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  4.gapH,
                  Text(
                    '$progressPercent%',
                    style: TextStyle(
                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w500,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          12.gapH,
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: milestone.progress,
              minHeight: 4.h,
              backgroundColor: context.colors.grey150,
              color: milestone.progressColor,
            ),
          ),
        ],
      ),
    );
  }
}
