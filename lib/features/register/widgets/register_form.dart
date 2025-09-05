import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/features/register/widgets/field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedSex;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/add_user.svg',
                width: 24,
                colorFilter: ColorFilter.mode(
                  AppColors.mutedForeground,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'البيانات الشخصية',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                  color: AppColors.foreground,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          FieldTitle('الاسم بالكامل *'),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'أدخل اسمك بالكامل',
            controller: nameController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'يجب ادخال اسمك بالكامل';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16),
          FieldTitle('رقم الهاتف (Whats App) *'),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: '01xxxxxxxxx',
            controller: phoneController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'يجب ادخال رقم هاتفك';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16),
          FieldTitle('الرقم القومي *'),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'أدخل رقمك القومي',
            controller: idController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'يجب ادخال رقمك القومي';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitle('الفرقة *'),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'الفرقة',
                      controller: gradeController,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'يجب ادخال هذا الحقل';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitle('الجنس *'),
                    SizedBox(height: 16),
                    CustomDropdownField(
                      hintText: 'الجنس',
                      items: [
                        {'value': 'male', 'label': 'ذكر'},
                        {'value': 'female', 'label': 'أنثى'},
                      ],
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'يجب ادخال هذا الحقل';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) => setState(() {
                        selectedSex = value;
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'تسجيل الآن',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hintText,
    this.validator,
  });

  final List<Map<String, String>> items;
  final Function(String?) onChanged;
  final String? value;
  final String? hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      validator: validator,
      onChanged: onChanged,
      isExpanded: true,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Cairo',
        color: AppColors.foreground,
      ),
      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.mutedForeground),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Cairo',
          color: AppColors.mutedForeground,
          fontSize: 14,
        ),
        fillColor: AppColors.muted,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.primary, width: 2),
      ),
      dropdownColor: AppColors.muted,
      items: items.map<DropdownMenuItem<String>>((Map<String, String> item) {
        return DropdownMenuItem<String>(
          value: item['value'],
          child: Text(
            item['label']!,
            style: TextStyle(
              fontFamily: 'Cairo',
              color: AppColors.foreground,
              fontSize: 16,
            ),
          ),
        );
      }).toList(),
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

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Cairo',
        color: AppColors.foreground,
      ),
      cursorColor: AppColors.foreground,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Cairo',
          color: AppColors.mutedForeground,
          fontSize: 14,
        ),
        errorStyle: TextStyle(fontFamily: 'Cairo'),
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
