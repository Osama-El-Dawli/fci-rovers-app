import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.scaleFactor = 1.1,
    this.duration = const Duration(milliseconds: 250),
    required this.onPressed,
    this.title,
  });

  final VoidCallback onPressed;
  final double scaleFactor;
  final Duration duration;
  final String? title;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 750;
    final isTablet = screenWidth >= 750 && screenWidth < 1200;

    double horizontalPadding;
    double fontSize;
    double iconSize;

    if (isMobile) {
      horizontalPadding = 24;
      fontSize = 16;
      iconSize = 16;
    } else if (isTablet) {
      horizontalPadding = 28;
      fontSize = 17;
      iconSize = 17;
    } else {
      horizontalPadding = 32;
      fontSize = 20;
      iconSize = 20;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 2 : 4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primaryGlow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              foregroundColor: AppColors.background,
            ),
            onPressed: widget.onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/add_user.svg',
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    AppColors.background,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title ?? 'سجل الآن',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
