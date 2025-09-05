import 'package:fci_rovers_app/core/widgets/adaptive_layout.dart';
import 'package:fci_rovers_app/features/register/views/register_desktop.dart';
import 'package:fci_rovers_app/features/register/views/register_mobile.dart';
import 'package:flutter/material.dart';

class RegisterViewLayout extends StatelessWidget {
  const RegisterViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const RegisterMobile(),
      desktopLayout: (context) => const RegisterDesktop(),
    );
  }
}
