import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.backgroundColor,
  });

  final double? height;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: backgroundColor ?? Colors.white,
      toolbarHeight: height ?? 68.h,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.white,
      // AppBar constrains the leading slot to [leadingWidth]. Include outer
      // margin + padded IconButton (~48+) or the back control shrinks or clips.
      leadingWidth: leadingWidth ?? (context.canPop() ? 74.w : 20.w),
      leading: leading ?? _buildLeading(context),
      title: title,
      titleTextStyle: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colors.textPrimary,
      ),
      titleSpacing: 0,
      centerTitle: centerTitle ?? true,
      actions: actions,
      scrolledUnderElevation: 0,
    );
  }

  Widget _buildLeading(BuildContext context) {
    if (context.canPop()) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: context.colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: context.colors.stroke.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 22.sp,
            color: context.colors.textPrimary,
          ),
          onPressed: () => context.safePop(),
          padding: EdgeInsets.all(8.w),
          constraints: const BoxConstraints(),
        ),
      );
    }
    return SizedBox.shrink();
  }

  @override
  Size get preferredSize => Size(double.infinity, height ?? 68.h);
}
