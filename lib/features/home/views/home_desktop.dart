import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/features/home/widgets/home_header.dart';
import 'package:fci_rovers_app/features/home/widgets/quote_box.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeHeader()),
          SliverToBoxAdapter(child: SizedBox(height: 48)),
          SliverToBoxAdapter(child: QuoteBox()),
          SliverToBoxAdapter(child: SizedBox(height: 48)),
        ],
      ),
    );
  }
}
