import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/gen/assets.gen.dart';

enum SocialProvider { google, apple }

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.provider,
    required this.onPressed,
  });

  final SocialProvider provider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final label = provider == SocialProvider.google
        ? 'Continue with Google'
        : 'Continue with Apple';

    return Material(
      color: context.colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Ink(
          height: 48.h,
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: context.colors.grey250),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider == SocialProvider.google)
                SvgPicture.asset(Assets.icons.google, width: 20.r, height: 20.r)
              else
                SvgPicture.asset(Assets.icons.apple, width: 20.r, height: 20.r),
              6.gapW,
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w600,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

