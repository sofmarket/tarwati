import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/app_icon_widget.dart';
import 'package:tarwati/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMenuItem {
  const AboutMenuItem({
    required this.title,
    required this.subtitle,
    this.icon,
    this.iconPath,
    this.onTap,
  }) : assert(icon != null || iconPath != null);

  final String title;
  final String subtitle;
  final IconData? icon;
  final String? iconPath;
  final VoidCallback? onTap;
}

final _aboutMenuItems = [
  AboutMenuItem(
    title: 'Our Mission',
    subtitle: 'Empower your financial future.',
    icon: Icons.menu_book_outlined,
  ),
  AboutMenuItem(
    title: 'Our Vision',
    subtitle: 'A financially independent Arab world.',
    icon: Icons.visibility_outlined,
  ),
  AboutMenuItem(
    title: 'Why Namaa?',
    subtitle: 'Smart • Simple • Secure',
    icon: Icons.access_time_rounded,
  ),
  AboutMenuItem(
    title: 'Contact Us',
    subtitle: "We're here to help.",
    iconPath: Assets.icons.phone,
  ),
];

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const _description =
      'Namaa is your AI-powered financial advisor that helps you plan, save, invest and achieve your financial goals with confidence.';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      appBar: CustomAppBar(
        title: const Text('About Tarwati'),
        centerTitle: true,
        backgroundColor: context.colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 24.h),
        child: Column(
          children: [
            const AppIconWidget(),
            20.gapH,
            Text(
              'Tarwati ثروتي',
              style: TextStyle(
                fontSize: 24.spMin,
                fontWeight: FontWeight.w700,
                color: context.colors.textPrimary,
              ),
            ),
            6.gapH,
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w500,
                color: context.colors.textSecondary,
              ),
            ),
            24.gapH,
            Text(
              _description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: context.colors.textSecondary,
              ),
            ),
            28.gapH,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: context.colors.grey250),
              ),
              child: Column(
                children: List.generate(_aboutMenuItems.length, (index) {
                  final item = _aboutMenuItems[index];
                  return _AboutMenuRow(
                    item: item,
                    showDivider: index != _aboutMenuItems.length - 1,
                  );
                }),
              ),
            ),
            Spacer(),
            RightsSectionWidget(),
          ],
        ),
      ),
    );
  }
}

class _AboutMenuRow extends StatelessWidget {
  const _AboutMenuRow({required this.item, required this.showDivider});

  final AboutMenuItem item;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: context.colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                      color: context.colors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: item.iconPath != null
                        ? SvgPicture.asset(
                            item.iconPath!,
                            width: 20.r,
                            height: 20.r,
                            colorFilter: ColorFilter.mode(
                              context.colors.primary,
                              BlendMode.srcIn,
                            ),
                          )
                        : Icon(
                            item.icon,
                            size: 20.r,
                            color: context.colors.primary,
                          ),
                  ),
                  12.gapW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w700,
                            color: context.colors.textPrimary,
                          ),
                        ),
                        2.gapH,
                        Text(
                          item.subtitle,
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 22.r,
                    color: context.colors.textTertiary,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: 68.w,
            color: context.colors.grey150,
          ),
      ],
    );
  }
}

class RightsSectionWidget extends StatelessWidget {
  const RightsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: MediaQuery.paddingOf(context).bottom + 16.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.colors.stroke.withValues(alpha: 0.14)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36.r,
            height: 3.r,
            margin: EdgeInsets.only(bottom: 14.h),
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Text(
          //   context.t.about.copyrightNotice.replaceAll('{year}', '$year'),
          //   textAlign: TextAlign.center,
          //   style: context.textTheme.labelSmall?.copyWith(
          //     color: context.colors.textSecondary,
          //     fontWeight: FontWeight.w600,
          //     height: 1.4,
          //   ),
          // ),
          // 8.gapH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Developed with love by ',
                textAlign: TextAlign.center,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.textTertiary,
                ),
              ),
              6.gapW,
              GestureDetector(
                onTap: () {
                  launchUrl(
                    Uri.parse('https://www.instagram.com/soufiane.karroumi.1'),
                  );
                },
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    '@soufiane',
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.secondaryDarker,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
