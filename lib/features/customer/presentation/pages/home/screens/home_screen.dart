import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_app_bar.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/ai_advisor_card_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/at_a_glance_section_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/expert_banner_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/financial_health_card_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/recent_insights_widget.dart';
import 'package:tarwati/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: SizedBox.shrink(),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: SvgPicture.asset(Assets.icons.menu),
        ),
        leadingWidth: 58.r,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Stack(
              children: [
                SvgPicture.asset(Assets.icons.bell, fit: BoxFit.contain),
                Positioned(
                  top: 1.r,
                  right: 3.r,
                  child: Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      bottomNavigationBar: CustomerBottomNavWidget(currentIndex: 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: TextStyle(
                    fontSize: 11.r,
                    fontWeight: FontWeight.w500,
                    color: context.colors.textSecondary,
                  ),
                ),
                Text(
                  'Alex 👋',
                  style: TextStyle(
                    fontSize: 21.r,
                    fontWeight: FontWeight.w700,
                    color: context.colors.textPrimary,
                  ),
                ),
              ],
            ),
            20.gapH,
            const AiAdvisorCardWidget(),
            20.gapH,
            const FinancialHealthCardWidget(),
            28.gapH,
            const AtAGlanceSectionWidget(),
            28.gapH,
            const ExpertBannerWidget(),
            28.gapH,
            const RecentInsightsWidget(),
          ],
        ),
      ),
    );
  }
}
