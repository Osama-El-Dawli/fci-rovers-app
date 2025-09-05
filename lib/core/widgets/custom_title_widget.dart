import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize;
    if (screenWidth < 400) {
      fontSize = 20;
    } else if (screenWidth < 800) {
      fontSize = 28;
    } else {
      fontSize = 36;
    }

    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.foreground,
        fontSize: fontSize,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
