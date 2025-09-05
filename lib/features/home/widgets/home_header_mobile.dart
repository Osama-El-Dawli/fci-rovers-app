import 'package:flutter/material.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'home_header_text.dart';

class HomeHeaderMobile extends StatelessWidget {
  const HomeHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth < 400;

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffffffff).withValues(alpha: .3),
          radius: isNarrow ? 25 : 32,
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'عشيرة جوالة حاسبات ومعلومات',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryForeground,
              fontSize: isNarrow ? 20 : 24,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const HomeHeaderText(
          text:
              'لو نفسك تعيش مغامرات جديدة، تكتشف قدراتك، وتكّون عيلة تفضل جنبك على طول',
        ),
        const HomeHeaderText(text: 'انضم لعشيرة جوالة حاسبات ومعلومات ⚜️💻'),
        const HomeHeaderText(
          text:
              'مكانك معانا هيكون بداية لحكاية مليانة نشاط، خدمة، وذكريات ما تتنسيش! 🌠',
        ),
        const HomeHeaderText(
          text: '#جوالة_حاسبات #رحلة_مش_هتتنسي',
          isItalic: true,
        ),
      ],
    );
  }
}
