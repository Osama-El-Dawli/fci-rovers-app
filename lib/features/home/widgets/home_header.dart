import 'package:fci_rovers_app/core/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'home_header_mobile.dart';
import 'home_header_desktop.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    return CustomHeader(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 16.0 : 24.0,
          horizontal: isSmallScreen ? 8.0 : 0.0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: isSmallScreen
                ? const HomeHeaderMobile()
                : const HomeHeaderDesktop(),
          ),
        ),
      ),
    );
  }
}
