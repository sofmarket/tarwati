import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/app_icon_widget.dart';
import 'package:tarwati/gen/assets.gen.dart';

class TermsSection {
  const TermsSection({
    required this.title,
    required this.content,
    this.icon,
    this.iconPath,
  }) : assert(icon != null || iconPath != null);

  final String title;
  final String content;
  final IconData? icon;
  final String? iconPath;
}

final _termsSections = [
  TermsSection(
    title: '1. Acceptance of Terms',
    content:
        'By accessing or using Tarwati, you agree to be bound by these Terms & Conditions. If you do not agree, please do not use the application or any of its services.',
    icon: Icons.check_circle_outline_rounded,
  ),
  TermsSection(
    title: '2. Use of Service',
    content:
        'Tarwati provides AI-powered financial guidance, planning tools, and access to licensed financial experts. You agree to use the platform only for lawful purposes and in accordance with applicable regulations in your jurisdiction.',
    icon: Icons.devices_rounded,
  ),
  TermsSection(
    title: '3. Account Responsibilities',
    content:
        'You are responsible for maintaining the confidentiality of your account credentials and for all activity under your account. You must provide accurate information and notify us promptly of any unauthorized use.',
    icon: Icons.person_outline_rounded,
  ),
  TermsSection(
    title: '4. Financial Information Disclaimer',
    content:
        'Content provided through Tarwati is for informational and educational purposes only and does not constitute personalized financial, legal, or tax advice. Always consult a qualified professional before making financial decisions.',
    iconPath: Assets.icons.warningCircle,
  ),
  TermsSection(
    title: '5. Privacy & Data',
    content:
        'Your use of Tarwati is also governed by our Privacy Policy. We collect and process personal and financial data to deliver our services, improve your experience, and comply with legal obligations.',
    icon: Icons.shield_outlined,
  ),
  TermsSection(
    title: '6. Limitation of Liability',
    content:
        'Tarwati and its affiliates shall not be liable for any indirect, incidental, or consequential damages arising from your use of the platform, including investment losses or decisions made based on app content.',
    icon: Icons.balance_rounded,
  ),
  TermsSection(
    title: '7. Changes to Terms',
    content:
        'We may update these Terms & Conditions from time to time. Continued use of Tarwati after changes are posted constitutes acceptance of the revised terms. Material changes will be communicated through the app.',
    iconPath: Assets.icons.refreshCircle,
  ),
  TermsSection(
    title: '8. Contact Us',
    content:
        'If you have questions about these Terms & Conditions, please contact our support team at support@tarwati.com or through the in-app Help Center.',
    iconPath: Assets.icons.phone,
  ),
];

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  static const _intro =
      'Please read these Terms & Conditions carefully before using Tarwati. They outline your rights and responsibilities when using our platform.';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      appBar: CustomAppBar(
        title: const Text('Terms & Conditions'),
        centerTitle: true,
        backgroundColor: context.colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
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
              'Last updated: 15 May 2024',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w500,
                color: context.colors.textSecondary,
              ),
            ),
            24.gapH,
            Text(
              _intro,
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
                children: List.generate(_termsSections.length, (index) {
                  final section = _termsSections[index];
                  return _TermsSectionRow(
                    section: section,
                    showDivider: index != _termsSections.length - 1,
                  );
                }),
              ),
            ),
            24.gapH,
          ],
        ),
      ),
    );
  }
}

class _TermsSectionRow extends StatelessWidget {
  const _TermsSectionRow({required this.section, required this.showDivider});

  final TermsSection section;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: section.iconPath != null
                    ? SvgPicture.asset(
                        section.iconPath!,
                        width: 20.r,
                        height: 20.r,
                        colorFilter: ColorFilter.mode(
                          context.colors.primary,
                          BlendMode.srcIn,
                        ),
                      )
                    : Icon(
                        section.icon,
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
                      section.title,
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w700,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    6.gapH,
                    Text(
                      section.content,
                      style: TextStyle(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w400,
                        height: 1.45,
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
