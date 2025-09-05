import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_header.dart';
import 'package:fci_rovers_app/core/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return CustomHeader(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 12.0 : 16.0,
          horizontal: isMobile ? 16 : (isTablet ? 32 : 48),
        ),
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context, isMobile, isTablet),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.background,
                    size: 14,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'العودة للرئيسية',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 8),
        Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'تسجيل عضو جديد',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12),
                CustomLogo(radius: 20, borderWidth: 2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios, color: AppColors.background, size: 16),
              SizedBox(width: 8),
              Text(
                'العودة للرئيسية',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: isTablet ? 15 : 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'تسجيل عضو جديد',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: isTablet ? 22 : 24,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: isTablet ? 14 : 16),
              CustomLogo(radius: isTablet ? 22 : 24, borderWidth: 2),
            ],
          ),
        ),
      ],
    );
  }
}
