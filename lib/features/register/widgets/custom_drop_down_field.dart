import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.value,
    this.validator,
  });

  final List<Map<String, String>> items;
  final Function(String?) onChanged;
  final String? value;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField<String>(
        initialValue: value,
        validator: validator,
        onChanged: onChanged,
        isExpanded: true,
        hint: Text(
          hintText,
          style: TextStyle(
            fontFamily: 'Cairo',
            color: AppColors.mutedForeground,
            fontSize: 14,
          ),
        ),
        style: TextStyle(fontSize: 16, color: AppColors.foreground),
        icon: Icon(Icons.keyboard_arrow_down, color: AppColors.mutedForeground),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: 'Cairo',
            color: AppColors.mutedForeground,
            fontSize: 14,
          ),
          fillColor: AppColors.muted,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(color: AppColors.primary, width: 2),
        ),
        dropdownColor: AppColors.muted,
        menuMaxHeight: 200,
        items: items.map<DropdownMenuItem<String>>((Map<String, String> item) {
          return DropdownMenuItem<String>(
            value: item['value'],
            child: Text(
              item['label']!,
              style: TextStyle(
                fontFamily: 'Cairo',
                color: AppColors.foreground,
                fontSize: 16,
                height: 1.2,
              ),
            ),
          );
        }).toList(),
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
