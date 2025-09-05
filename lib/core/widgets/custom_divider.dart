import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double barWidth;
    double barHeight;
    double iconSize;

    if (screenWidth < 400) {
      barWidth = 10;
      barHeight = 3;
      iconSize = 30;
    } else if (screenWidth < 800) {
      barWidth = 12;
      barHeight = 4;
      iconSize = 40;
    } else {
      barWidth = 15;
      barHeight = 5;
      iconSize = 60;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          'assets/images/knot.svg',
          height: iconSize,
          colorFilter: ColorFilter.mode(AppColors.primaryGlow, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
