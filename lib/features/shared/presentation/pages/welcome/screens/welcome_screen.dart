import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_button.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/core/widgets/page_indicators_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/welcome/widgets/welcome_hero_section.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: context.colors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 15.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            8.gapH,
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 28.spMin,
                fontWeight: FontWeight.w800,
                color: context.colors.secondary,
                height: 1.2,
              ),
            ),
            Text(
              'Tarwati',
              style: TextStyle(
                fontSize: 28.spMin,
                fontWeight: FontWeight.w800,
                color: context.colors.primary,
                height: 1.2,
              ),
            ),
            12.gapH,
            Text(
              'Your AI-powered financial advisor that helps you plan, save, invest and achieve your dreams.',
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w400,
                color: context.colors.textSecondary,
                height: 1.5,
              ),
            ),
            54.gapH,
            const WelcomeHeroSection(),
            64.gapH,
            PageIndicatorsWidget(activeIndex: 0),
            const Spacer(),
            CustomButton(
              onPressed: () {},
              height: 48.h,
              gradient: LinearGradient(
                colors: [context.colors.primary, context.colors.primaryDarker],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16.r,
                      fontWeight: FontWeight.w700,
                      color: context.colors.white,
                    ),
                  ),
                  8.gapW,
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: context.colors.white,
                    size: 20.r,
                  ),
                ],
              ),
            ),
            16.gapH,
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.r,
                    fontWeight: FontWeight.w400,
                    color: context.colors.textSecondary,
                  ),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 14.spMin,
                            fontWeight: FontWeight.w700,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            24.gapH,
          ],
        ),
      ),
    );
  }
}
