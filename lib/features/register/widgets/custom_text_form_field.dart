import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.maxLines,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      style: const TextStyle(fontSize: 16, color: AppColors.foreground),
      cursorColor: AppColors.foreground,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.mutedForeground,
          fontSize: 14,
        ),
        fillColor: AppColors.muted,
        filled: true,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.primary, width: 2),
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? AppColors.accent.withValues(alpha: 0.3),
        width: width ?? 1,
      ),
    );
  }
}
