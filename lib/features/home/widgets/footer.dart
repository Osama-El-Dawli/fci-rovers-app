import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
        ),
        color: AppColors.muted.withValues(alpha: 0.3),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      alignment: Alignment.center,
      child: const Text(
        'جميع الحقوق محفوظة © 2025',
        style: TextStyle(fontSize: 16, color: AppColors.secondary),
      ),
    );
  }
}
