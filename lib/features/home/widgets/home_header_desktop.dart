import 'package:fci_rovers_app/core/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'home_header_text.dart';

class HomeHeaderDesktop extends StatelessWidget {
  const HomeHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLogo(),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'عشيرة جوالة حاسبات ومعلومات',
              style: TextStyle(
                color: AppColors.primaryForeground,
                fontSize: 40,

                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeHeaderText(
                  text:
                      'لو نفسك تعيش مغامرات جديدة، تكتشف قدراتك، وتكّون عيلة تفضل جنبك على طول',
                ),
                HomeHeaderText(text: 'انضم لعشيرة جوالة حاسبات ومعلومات ⚜️💻'),
                HomeHeaderText(
                  text:
                      'مكانك معانا هيكون بداية لحكاية مليانة نشاط، خدمة، وذكريات ما تتنسيش! 🌠',
                ),
                HomeHeaderText(
                  text: '#جوالة_حاسبات #رحلة_مش_هتتنسي',
                  isItalic: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
