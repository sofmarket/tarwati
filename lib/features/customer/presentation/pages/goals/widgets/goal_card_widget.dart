import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/models/goal_model.dart';
import 'package:tarwati/features/customer/presentation/pages/goals/widgets/goal_field_widget.dart';

class GoalCardWidget extends StatelessWidget {
  const GoalCardWidget({
    super.key,
    required this.goal,
    required this.onToggle,
  });

  final GoalModel goal;
  final ValueChanged<bool> onToggle;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              color: goal.iconBackgroundColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              goal.icon,
              size: 22.r,
              color: goal.iconColor,
            ),
          ),
          12.gapW,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        goal.title,
                        style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w700,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 0.85,
                      child: Switch(
                        value: goal.isEnabled,
                        onChanged: onToggle,
                        activeTrackColor: context.colors.primary,
                        inactiveTrackColor: context.colors.grey250,
                        inactiveThumbColor: context.colors.white,
                        trackOutlineColor: WidgetStateProperty.all(
                          context.colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
                if (goal.isEnabled) ...[
                  12.gapH,
                  Row(
                    children: [
                      Expanded(
                        child: GoalFieldWidget(
                          label: 'Target Amount',
                          value: goal.targetAmount,
                        ),
                      ),
                      10.gapW,
                      Expanded(
                        child: GoalFieldWidget(
                          label: 'Target Date',
                          value: goal.targetDate,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
