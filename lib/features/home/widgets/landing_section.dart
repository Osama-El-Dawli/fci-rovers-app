import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/core/widgets/custom_logo.dart';
import 'package:fci_rovers_app/features/register/views/register_view_layout.dart';
import 'package:flutter/material.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 750;
    final isTablet = screenWidth >= 750 && screenWidth < 1200;

    final double sectionHeight = isMobile
        ? 450.0
        : isTablet
        ? 520.0
        : 600.0;

    final double titleFontSize = isMobile
        ? 24.0
        : isTablet
        ? 34.0
        : 42.0;

    final double subtitleFontSize = isMobile
        ? 14.0
        : isTablet
        ? 18.0
        : 22.0;

    final double quoteFontSize = isMobile
        ? 15.0
        : isTablet
        ? 19.0
        : 23.0;

    final double logoRadius = isMobile ? 45.0 : 55.0;

    return Container(
      width: double.infinity,
      height: sectionHeight,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/landing.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.background.withValues(alpha: 0.65),
                  AppColors.background.withValues(alpha: 0.85),
                  AppColors.background.withValues(alpha: 0.98),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20.0 : 48.0,
                vertical: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomLogo(
                    radius: logoRadius,
                    borderWidth: isMobile ? 2.5 : 3.5,
                  ),
                  const SizedBox(height: 20),

                  Text(
                    'عشيرة جوالة حاسبات ومعلومات',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryGlow,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 8.0,
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 750),
                    child: Text(
                      'مكانك معانا هيكون بداية لحكاية مليانة إبداع ، ونشاط ، وذكريات ما تتنسيش',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.foreground.withValues(alpha: 0.9),
                        fontSize: subtitleFontSize,
                        height: 1.5,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 1),
                            blurRadius: 4.0,
                            color: Colors.black.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'الرحلة بتبدأ بخطوة ... وخطوتك تبدأ معانا',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: quoteFontSize,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 1),
                          blurRadius: 6.0,
                          color: Colors.black.withValues(alpha: 0.8),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterViewLayout(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
