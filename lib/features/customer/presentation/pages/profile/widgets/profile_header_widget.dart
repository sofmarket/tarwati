import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
    this.name = 'Alex',
    this.memberSince = 'Jan 2024',
    this.onEditPhoto,
  });

  final String name;
  final String memberSince;
  final VoidCallback? onEditPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 28.h),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 96.r,
                height: 96.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.grey150,
                  border: Border.all(
                    color: context.colors.primary.withValues(alpha: 0.35),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 52.r,
                  color: context.colors.grey400,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Material(
                  color: context.colors.transparent,
                  child: InkWell(
                    onTap: onEditPhoto,
                    customBorder: const CircleBorder(),
                    child: Ink(
                      width: 28.r,
                      height: 28.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.success,
                        border: Border.all(
                          color: context.colors.white,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.edit_rounded,
                        size: 14.r,
                        color: context.colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          16.gapH,
          Text(
            '$name 👋',
            style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w700,
              color: context.colors.textPrimary,
            ),
          ),
          6.gapH,
          Text(
            'Member since: $memberSince',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w500,
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
