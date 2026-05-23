import 'package:flutter/material.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/widgets/custom_scaffold.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/app_icon_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/glass_card_widget.dart';
import 'package:tarwati/features/shared/presentation/pages/splash/widgets/stars_widget.dart';
import 'package:tarwati/core/utils/context_extensions.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasSafeArea: true,
      statusBarColor: context.colors.primaryDarker,
      backgroundColor: context.colors.primaryDarker,
      body: Stack(
        children: [
          // Background star particles
          StarsWidget(),
          // Main content
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                60.gapH,
            
                // App Icon
                AppIconWidget(),
            
                6.gapH,
            
                // App Name
                Column(
                  children: [
                    Text(
                      'Tarwati',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: context.colors.white,
                      ),
                    ),
                    2.gapH,
                    Text(
                      'Your AI Financial Advisor',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: context.colors.white.withValues(alpha: 0.65),
                      ),
                    ),
                  ],
                ),
            
                68.gapH,
            
                GlassCardWidget(),
            
                const Spacer(),
            
                // Tagline
                Column(
                  children: [
                    Text(
                      'Your money. Your goals.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: context.colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                    6.gapH,
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'Our AI. ',
                            style: TextStyle(
                              color: context.colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                          TextSpan(
                            text: 'Your freedom.',
                            style: TextStyle(color: context.colors.primaryDarkest),
                          ),
                        ],
                      ),
                    ),
                    16.gapH,
                    CircularProgressIndicator(
                      color: context.colors.primaryDarkest,
                      backgroundColor: context.colors.white.withValues(alpha: 0.2),
                    ),
                  ],
                ),
            
                28.gapH,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
