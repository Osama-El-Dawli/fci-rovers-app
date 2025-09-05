import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.scaleFactor = 1.1,
    this.duration = const Duration(milliseconds: 250),
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final double scaleFactor;
  final Duration duration;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                  width: 18,
                  colorFilter: ColorFilter.mode(
                    AppColors.background,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'سجل الآن',
                  style: TextStyle(
                    fontSize: 18,
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
