import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_card.dart';
import 'package:fci_rovers_app/features/register/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    if (isMobile) {
      return _buildMobileLayout();
    } else {
      return _buildDesktopLayout(isTablet);
    }
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'انضم إلى عائلة الكشافة',
                style: TextStyle(
                  fontSize: 24, // Smaller for mobile
                  color: AppColors.primary,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'املأ البيانات التالية للتسجيل في الحركة الكشفية',
                style: TextStyle(
                  fontSize: 16, // Smaller for mobile
                  fontFamily: 'Cairo',
                  color: AppColors.mutedForeground,
                ),
              ),
              SizedBox(height: 24), // Reduced spacing
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      children: [
        Spacer(flex: 1),
        Expanded(
          flex: isTablet ? 3 : 2, // Wider on tablet for better use of space
          child: CustomCard(
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 20 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'انضم إلى عائلة الكشافة',
                    style: TextStyle(
                      fontSize: isTablet ? 26 : 30,
                      color: AppColors.primary,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'املأ البيانات التالية للتسجيل في الحركة الكشفية',
                    style: TextStyle(
                      fontSize: isTablet ? 16 : 18,
                      fontFamily: 'Cairo',
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  SizedBox(height: 32),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
