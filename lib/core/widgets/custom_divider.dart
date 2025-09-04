import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(width: 8),
        SvgPicture.asset(
          'assets/images/knot.svg',
          height: 60,
          colorFilter: ColorFilter.mode(AppColors.primaryGlow, BlendMode.srcIn),
        ),
        SizedBox(width: 8),
        Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
