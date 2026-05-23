import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';

class PageIndicatorsWidget extends StatelessWidget {
  const PageIndicatorsWidget({super.key, required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: isActive ? 8.r : 6.r,
          height: isActive ? 8.r : 6.r,
          decoration: BoxDecoration(
            color: isActive ? context.colors.primary : context.colors.grey300,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
