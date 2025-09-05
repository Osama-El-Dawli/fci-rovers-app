import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_card.dart';
import 'package:fci_rovers_app/features/register/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: CustomCard(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'انضم إلى عائلة الكشافة',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.primary,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'املأ البيانات التالية للتسجيل في الحركة الكشفية',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cairo',
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  SizedBox(height: 32),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
