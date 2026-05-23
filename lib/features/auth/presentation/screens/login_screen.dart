import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tarwati/core/routing/routes.dart';
import 'package:tarwati/core/utils/context_extensions.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_button.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/auth/presentation/widgets/glow_circle_widget.dart';
import 'package:tarwati/features/auth/presentation/widgets/login_security_banner.dart';
import 'package:tarwati/features/auth/presentation/widgets/login_text_field.dart';
import 'package:tarwati/features/auth/presentation/widgets/or_divider_widget.dart';
import 'package:tarwati/features/auth/presentation/widgets/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      backgroundColor: context.colors.white,
      statusBarColor: context.colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0.h,
            right: -60.w,
            child: GlowCircleWidget(
              size: 180.r,
              color: context.colors.primary.withValues(alpha: 0.12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: context.safePop,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24.r,
                    color: context.colors.textPrimary,
                  ),
                ),
                16.gapH,
                Text(
                  'Welcome back 👋',
                  style: TextStyle(
                    fontSize: 26.spMin,
                    fontWeight: FontWeight.w800,
                    color: context.colors.secondary,
                    height: 1.2,
                  ),
                ),
                8.gapH,
                Text(
                  'Log in to continue your financial journey',
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w400,
                    color: context.colors.textSecondary,
                    height: 1.4,
                  ),
                ),
                28.gapH,
                Row(
                  children: [
                    Expanded(
                      child: SocialLoginButton(
                        provider: SocialProvider.google,
                        onPressed: () {},
                      ),
                    ),
                    12.gapW,
                    Expanded(
                      child: SocialLoginButton(
                        provider: SocialProvider.apple,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                24.gapH,
                OrDividerWidget(),
                24.gapH,
                LoginTextField(
                  label: 'Email address',
                  hint: 'Enter your email',
                  prefixIcon: Icons.mail_outline_rounded,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                20.gapH,
                LoginPasswordField(controller: _passwordController),
                12.gapH,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: context.colors.primary,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                20.gapH,
                CustomButton(
                  onPressed: () => context.goNamed(Routes.customer.name),
                  height: 54.h,
                  width: double.infinity,
                  backgroundColor: context.colors.primary,
                  foregroundColor: context.colors.white,
                  text: 'Log In',
                  textStyle: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Divider(color: context.colors.grey250, height: 1),
                20.gapH,
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w400,
                        color: context.colors.textSecondary,
                      ),
                      children: [
                        const TextSpan(text: 'Don\'t have an account? '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Create account',
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
                28.gapH,
                const LoginSecurityBanner(),
                16.gapH,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
