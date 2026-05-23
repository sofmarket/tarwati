import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class AtAGlanceSectionWidget extends StatelessWidget {
  const AtAGlanceSectionWidget({super.key});

  static const _items = [
    _GlanceItem(
      icon: Icons.home_outlined,
      iconColor: Color(0xFF4285F4),
      label: 'Monthly Income',
      value: '\$6,250',
    ),
    _GlanceItem(
      icon: Icons.account_balance_wallet_outlined,
      iconColor: Color(0xFFEA4335),
      label: 'Monthly Expenses',
      value: '\$3,420',
    ),
    _GlanceItem(
      icon: Icons.savings_outlined,
      iconColor: Color(0xFF34A853),
      label: 'Savings',
      value: '\$12,830',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'At a Glance',
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.w700,
                color: context.colors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: context.colors.primary,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        14.gapH,
        SizedBox(
          height: 110.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _items.length,
            separatorBuilder: (context, index) => 12.gapW,
            itemBuilder: (context, index) {
              final item = _items[index];
              return _GlanceCard(item: item);
            },
          ),
        ),
      ],
    );
  }
}

class _GlanceItem {
  const _GlanceItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
}

class _GlanceCard extends StatelessWidget {
  const _GlanceCard({required this.item});

  final _GlanceItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34.r,
            height: 34.r,
            decoration: BoxDecoration(
              color: item.iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(item.icon, size: 18.r, color: item.iconColor),
          ),
          const Spacer(),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 11.spMin,
              fontWeight: FontWeight.w500,
              color: context.colors.textSecondary,
            ),
          ),
          4.gapH,
          Text(
            item.value,
            style: TextStyle(
              fontSize: 16.spMin,
              fontWeight: FontWeight.w800,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
