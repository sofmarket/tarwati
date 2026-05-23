import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/gen/assets.gen.dart';

class CustomerBottomNavWidget extends StatelessWidget {
  const CustomerBottomNavWidget({super.key, this.currentIndex = 0});

  final int currentIndex;

  static final _items = [
    BottomNavItem(
      icon: Assets.icons.home,
      label: 'Home',
      route: Routes.customer.name,
    ),
    BottomNavItem(
      icon: Assets.icons.edit,
      label: 'Plan',
      route: Routes.plan.name,
    ),
    BottomNavItem(
      icon: Assets.icons.goal,
      label: 'Goals',
      route: Routes.goals.name,
    ),
    BottomNavItem(
      icon: Assets.icons.users,
      label: 'Experts',
      route: Routes.experts.name,
    ),
    BottomNavItem(
      icon: Assets.icons.user,
      label: 'Profile',
      route: Routes.profile.name,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        border: Border(
          top: BorderSide(color: context.colors.stroke, width: 1.r),
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
                onTap: () => context.goNamed(item.route),
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
  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  final String icon;
  final String label;
  final String route;
}
