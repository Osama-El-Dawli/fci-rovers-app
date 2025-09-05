import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/features/register/widgets/register_header.dart';
import 'package:flutter/material.dart';

class RegisterDesktop extends StatelessWidget {
  const RegisterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const CustomScrollView(
        slivers: [SliverToBoxAdapter(child: RegisterHeader())],
      ),
    );
  }
}
