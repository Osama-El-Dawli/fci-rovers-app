import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final bool isSuccess;
  final VoidCallback? onButtonPressed;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    this.isSuccess = true,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    // Responsive sizing
    final horizontalPadding = isSmallScreen ? 24.0 : 48.0;
    final verticalPadding = isSmallScreen ? 24.0 : 28.0;
    final iconSize = isSmallScreen ? 35.0 : 40.0;
    final iconTopOffset = isSmallScreen ? -20.0 : -30.0;
    final titleFontSize = isSmallScreen ? 18.0 : 20.0;
    final messageFontSize = isSmallScreen ? 14.0 : 16.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16.0 : 20.0,
        vertical: 24.0,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          CustomCard(
            child: Container(
              // width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: isSmallScreen ? 12 : 14),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 12),
                  Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: messageFontSize,
                        color: AppColors.foreground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 28),
                  CustomButton(
                    onPressed: onButtonPressed ?? () {},
                    title: 'حسنا',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: iconTopOffset,
            child: Container(
              padding: EdgeInsets.all(isSmallScreen ? 6 : 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primaryGlow,
                    AppColors.foreground,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Icon(
                isSuccess ? Icons.check_rounded : Icons.close_rounded,
                size: iconSize,
                color: AppColors.background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
