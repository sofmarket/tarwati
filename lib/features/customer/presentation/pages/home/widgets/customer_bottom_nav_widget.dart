import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/gen/assets.gen.dart';

class CustomerBottomNavWidget extends StatelessWidget {
  const CustomerBottomNavWidget({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  static final _items = [
    BottomNavItem(icon: Assets.icons.home, label: 'Home'),
    BottomNavItem(icon: Assets.icons.edit, label: 'Plan'),
    BottomNavItem(icon: Assets.icons.goal, label: 'Goals'),
    BottomNavItem(icon: Assets.icons.users, label: 'Experts'),
    BottomNavItem(icon: Assets.icons.user, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        border: Border(
          top: BorderSide(
            color: context.colors.stroke,
            width: 1.r,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isActive = index == currentIndex;
              final color = isActive
                  ? context.colors.primary
                  : context.colors.textTertiary;

              return InkWell(
                onTap: () => onTap?.call(index),
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        item.icon,
                        width: 24.r,
                        height: 24.r,
                        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                      ),
                      4.gapH,
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 12.r,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});

  final String icon;
  final String label;
}
