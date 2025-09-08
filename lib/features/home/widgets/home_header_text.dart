import 'package:flutter/material.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';

class HomeHeaderText extends StatelessWidget {
  final String text;
  final bool isItalic;

  const HomeHeaderText({super.key, required this.text, this.isItalic = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth < 800;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: isNarrow ? 8.0 : 0.0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryForeground,
          fontSize: isNarrow ? 14 : 16,

          fontWeight: FontWeight.w400,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        ),
      ),
    );
  }
}
