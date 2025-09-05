import 'package:fci_rovers_app/core/widgets/adaptive_layout.dart';
import 'package:fci_rovers_app/features/home/views/home_desktop.dart';
import 'package:fci_rovers_app/features/home/views/home_mobile.dart';
import 'package:flutter/material.dart';

class HomeViewLayout extends StatelessWidget {
  const HomeViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const HomeMobile(),
      desktopLayout: (context) => const HomeDesktop(),
    );
  }
}
