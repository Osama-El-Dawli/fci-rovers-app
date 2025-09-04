import 'package:dots_indicator/dots_indicator.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({
    super.key,
    required this.dotsCount,
    required this.position,
  });

  final int dotsCount;
  final double position;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        color: AppColors.border,
        activeColor: AppColors.primary,
        size: const Size(8, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
