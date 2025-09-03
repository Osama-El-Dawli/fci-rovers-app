import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.primary, AppColors.primaryGlow, AppColors.primary],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffffffff).withValues(alpha: .3),
                    radius: 36,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        'عشيرة جوالة حاسبات ومعلومات',
                        style: TextStyle(
                          color: AppColors.primaryForeground,
                          fontSize: 48,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'لو نفسك تعيش مغامرات جديدة، تكتشف قدراتك، وتكّون عيلة تفضل جنبك على طول',
                        style: TextStyle(
                          color: AppColors.primaryForeground,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'انضم لعشيرة جوالة حاسبات ومعلومات ⚜️💻',
                        style: TextStyle(
                          color: AppColors.primaryForeground,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'مكانك معانا هيكون بداية لحكاية مليانة نشاط، خدمة، وذكريات ما تتنسيش! 🌠',
                        style: TextStyle(
                          color: AppColors.primaryForeground,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '#جوالة_حاسبات\n#رحلة_مش_هتتنسي',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryForeground,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
