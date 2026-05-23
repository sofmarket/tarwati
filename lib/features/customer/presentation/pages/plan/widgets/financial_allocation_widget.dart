import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/features/customer/presentation/pages/plan/models/plan_model.dart';

class FinancialAllocationWidget extends StatelessWidget {
  const FinancialAllocationWidget({
    super.key,
    required this.items,
  });

  final List<PlanAllocationItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.grey250,
          width: 1.r,
        ),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == items.length - 1 ? 0 : 16.h,
            ),
            child: _AllocationRow(item: item),
          );
        }),
      ),
    );
  }
}

class _AllocationRow extends StatelessWidget {
  const _AllocationRow({required this.item});

  final PlanAllocationItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                color: item.iconBackgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                item.icon,
                size: 18.r,
                color: item.iconColor,
              ),
            ),
            12.gapW,
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w600,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
            Text(
              '${item.percentage}%',
              style: TextStyle(
                fontSize: 13.spMin,
                fontWeight: FontWeight.w600,
                color: context.colors.textSecondary,
              ),
            ),
            12.gapW,
            Text(
              '${item.monthlyAmount} /mo',
              style: TextStyle(
                fontSize: 13.spMin,
                fontWeight: FontWeight.w600,
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
        10.gapH,
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: item.percentage / 100,
            minHeight: 4.h,
            backgroundColor: context.colors.grey150,
            color: item.progressColor,
          ),
        ),
      ],
    );
  }
}
