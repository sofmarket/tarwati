import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: context.colors.grey250, height: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'or',
            style: TextStyle(
              fontSize: 13.spMin,
              fontWeight: FontWeight.w500,
              color: context.colors.textTertiary,
            ),
          ),
        ),
        Expanded(child: Divider(color: context.colors.grey250, height: 1)),
      ],
    );
  }
}
