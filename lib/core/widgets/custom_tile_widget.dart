import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.foreground,
        fontSize: 36,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
