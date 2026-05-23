import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/customer/presentation/pages/home/widgets/customer_bottom_nav_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/widgets/profile_action_card_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/widgets/profile_header_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/widgets/profile_info_row_widget.dart';
import 'package:tarwati/features/customer/presentation/pages/profile/widgets/profile_section_card_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: false,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      bottomNavigationBar: CustomerBottomNavWidget(currentIndex: 4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeaderWidget(),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 24.h),
              child: Column(
                children: [
                  ProfileSectionCardWidget(
                    title: 'Account Details',
                    children: [
                      ProfileInfoRowWidget(
                        label: 'Email',
                        value: 'alex.j@email.com',
                        trailing: Icon(
                          Icons.edit_rounded,
                          size: 16.r,
                          color: context.colors.primary,
                        ),
                        onTap: () {},
                      ),
                      ProfileInfoRowWidget(
                        label: 'Phone',
                        value: '+1-555-0199',
                        trailing: Icon(
                          Icons.edit_rounded,
                          size: 16.r,
                          color: context.colors.primary,
                        ),
                        onTap: () {},
                        showDivider: false,
                      ),
                    ],
                  ),
                  16.gapH,
                  ProfileSectionCardWidget(
                    title: 'Account Preferences',
                    children: [
                      ProfileInfoRowWidget(
                        label: 'Linked Bank Accounts',
                        value: '6 linked accounts',
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          size: 20.r,
                          color: context.colors.textTertiary,
                        ),
                        onTap: () {},
                      ),
                      ProfileInfoRowWidget(
                        label: 'Investment Portfolio',
                        value: 'Account portfolio',
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          size: 20.r,
                          color: context.colors.textTertiary,
                        ),
                        onTap: () {},
                      ),
                      ProfileInfoRowWidget(
                        label: 'Subscription Plan',
                        value: 'Premium',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Manage Plan',
                              style: TextStyle(
                                fontSize: 13.spMin,
                                fontWeight: FontWeight.w600,
                                color: context.colors.primary,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20.r,
                              color: context.colors.primary,
                            ),
                          ],
                        ),
                        onTap: () {},
                        showDivider: false,
                      ),
                    ],
                  ),
                  16.gapH,
                  ProfileSectionCardWidget(
                    title: 'Personalization',
                    children: [
                      ProfileInfoRowWidget(
                        label: 'Goal Milestones',
                        value: 'Link to goals',
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          size: 20.r,
                          color: context.colors.textTertiary,
                        ),
                        onTap: () {},
                      ),
                      ProfileInfoRowWidget(
                        label: 'Risk Profile',
                        value: 'Moderate',
                      ),
                      ProfileInfoRowWidget(
                        label: 'AI Advisor Voice',
                        value: 'Friendly',
                        showDivider: false,
                      ),
                    ],
                  ),
                  16.gapH,
                  Row(
                    children: [
                      Expanded(
                        child: ProfileActionCardWidget(
                          title: 'Security',
                          subtitle: 'Biometric Auth:\nEnabled',
                          icon: Icons.lock_outline_rounded,
                          onTap: () {},
                        ),
                      ),
                      12.gapW,
                      Expanded(
                        child: ProfileActionCardWidget(
                          title: 'Support',
                          subtitle: 'Help Center\nContact Support',
                          icon: Icons.chat_bubble_outline_rounded,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  20.gapH,
                  Material(
                    color: context.colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(14.r),
                      child: Ink(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: context.colors.white,
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(color: context.colors.grey200),
                        ),
                        child: Center(
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w700,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
