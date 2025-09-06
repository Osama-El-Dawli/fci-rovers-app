import 'package:fci_rovers_app/core/widgets/adaptive_layout.dart';
import 'package:fci_rovers_app/features/register/cubit/register_cubit.dart';
import 'package:fci_rovers_app/features/register/views/register_desktop.dart';
import 'package:fci_rovers_app/features/register/views/register_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewLayout extends StatelessWidget {
  const RegisterViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: AdaptiveLayout(
        mobileLayout: (context) => const RegisterMobile(),
        desktopLayout: (context) => const RegisterDesktop(),
      ),
    );
  }
}
