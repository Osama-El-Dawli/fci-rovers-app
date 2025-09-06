import 'dart:developer';

import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/features/register/widgets/custom_drop_down_field.dart';
import 'package:fci_rovers_app/features/register/widgets/custom_text_form_field.dart';
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
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    idController.clear();
    gradeController.clear();
    setState(() {
      selectedSex = null;
      _autovalidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
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
              if (value == null || value.isEmpty) {
                return 'يجب ادخال اسمك بالكامل';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          FieldTitle('رقم الهاتف (Whats App) *'),
          SizedBox(height: 16),
          CustomTextFormField(
            keyboardType: TextInputType.phone,
            hintText: '01xxxxxxxxx',
            controller: phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يجب ادخال رقم هاتفك';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          FieldTitle('الرقم القومي *'),
          SizedBox(height: 16),
          CustomTextFormField(
            keyboardType: TextInputType.number,
            hintText: 'أدخل رقمك القومي',
            controller: idController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يجب ادخال رقمك القومي';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitle('الفرقة *'),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      keyboardType: TextInputType.number,
                      hintText: 'الفرقة',
                      controller: gradeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال هذا الحقل';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitle('الجنس *'),
                    SizedBox(height: 16),
                    CustomDropdownField(
                      hintText: 'الجنس',
                      value: selectedSex,
                      items: [
                        {'value': 'male', 'label': 'ذكر'},
                        {'value': 'female', 'label': 'أنثى'},
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال هذا الحقل';
                        }
                        return null;
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
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });

                    if (_formKey.currentState!.validate()) {
                      log(nameController.text);
                      log(phoneController.text);
                      log(idController.text);
                      log(gradeController.text);
                      log(selectedSex.toString());

                      _clearForm();
                    }
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
