import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/features/register/widgets/register_header.dart';
import 'package:fci_rovers_app/features/register/widgets/register_section.dart';
import 'package:flutter/material.dart';

class RegisterDesktop extends StatelessWidget {
  const RegisterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          } else {
            Navigator.of(context).maybePop();
          }
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              RegisterHeader(),
              SizedBox(height: 32),
              Center(child: RegisterSection()),
            ],
          ),
        ),
      ),
    );
  }
}
