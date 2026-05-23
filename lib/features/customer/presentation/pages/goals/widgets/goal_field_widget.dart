import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class GoalFieldWidget extends StatelessWidget {
  const GoalFieldWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11.spMin,
            fontWeight: FontWeight.w500,
            color: context.colors.textTertiary,
          ),
        ),
        6.gapH,
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: context.colors.grey250,
              width: 1.r,
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: FontWeight.w500,
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
