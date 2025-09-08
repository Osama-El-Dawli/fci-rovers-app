import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/core/widgets/custom_dialog.dart';
import 'package:fci_rovers_app/features/register/cubit/register_cubit.dart';
import 'package:fci_rovers_app/features/register/models/user_model.dart';
import 'package:fci_rovers_app/features/register/widgets/custom_drop_down_field.dart';
import 'package:fci_rovers_app/features/register/widgets/custom_text_form_field.dart';
import 'package:fci_rovers_app/features/register/widgets/field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedSex;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  RegExp phoneRegExp = RegExp(r'^(01)[0-9]{9}$');

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    gradeController.dispose();
    hobbiesController.dispose();
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
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            useRootNavigator: true,
            builder: (_) => Center(
              child: RepaintBoundary(
                child: LottieBuilder.asset(
                  'assets/images/fire_loading.json',
                  width: 200,
                ),
              ),
            ),
          );
        } else if (state is RegisterSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          showDialog(
            context: context,
            useRootNavigator: true,
            barrierDismissible: false,
            builder: (_) => Center(
              child: CustomDialog(
                title: 'تم التسجيل بنجاح',
                message: 'شكراً لتسجيلك في فريق FCI Rovers!',
                onButtonPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  _clearForm();
                },
              ),
            ),
          );
        } else if (state is RegisterFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            useRootNavigator: true,
            builder: (_) => CustomDialog(
              isSuccess: false,
              title: 'حدث خطأ',
              message: state.errorMessage,
              onButtonPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          );
        }
      },
      child: Form(
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
                const SizedBox(width: 8),
                Text(
                  'البيانات الشخصية',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,

                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Form Fields
            FieldTitle('الاسم بالكامل *'),
            const SizedBox(height: 8),
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
            const SizedBox(height: 20),

            FieldTitle('رقم الهاتف (WhatsApp) *'),
            const SizedBox(height: 8),
            CustomTextFormField(
              keyboardType: TextInputType.phone,
              hintText: '01xxxxxxxxx',
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يجب ادخال رقم هاتفك';
                } else if (!phoneRegExp.hasMatch(value)) {
                  return 'يجب ادخال رقم هاتف صحيح';
                } else if (value.length != 11) {
                  return 'يجب ان يكون رقم الهاتف مكون من 11 رقم';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            FieldTitle('الرقم القومي *'),
            const SizedBox(height: 8),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              hintText: 'أدخل رقمك القومي',
              controller: idController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يجب ادخال رقمك القومي';
                } else if (value.length != 14) {
                  return 'يجب ان يكون الرقم القومي مكون من 14 رقم';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            FieldTitle('المواهب - الهوايات'),
            const SizedBox(height: 8),
            CustomTextFormField(
              maxLines: 3,
              keyboardType: TextInputType.text,
              hintText: 'لو عندك أي مواهب أو هوايات عرفنا بيها',
              controller: hobbiesController,
            ),
            const SizedBox(height: 20),

            // Grade and Gender Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldTitle('الفرقة *'),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: 'الفرقة',
                        controller: gradeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب ادخال هذا الحقل';
                          } else if (!['1', '2', '3', '4'].contains(value)) {
                            return 'يجب ادخال فرقة صحيحة (1-4)';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldTitle('الجنس *'),
                      const SizedBox(height: 8),
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
            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: 'تسجيل الآن',
                onPressed: () async {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });

                  if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                      hobbies: hobbiesController.text.trim(),
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                      id: num.parse(idController.text.trim()),
                      grade: int.parse(gradeController.text.trim()),
                      sex: selectedSex!,
                    );

                    context.read<RegisterCubit>().registerUser(user: user);
                  } else {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
