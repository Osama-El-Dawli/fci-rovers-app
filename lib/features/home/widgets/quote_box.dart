import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuoteBox extends StatelessWidget {
  const QuoteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.card, AppColors.muted],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  right: 16,
                  child: SvgPicture.asset(
                    'assets/images/double_quotes.svg',
                    colorFilter: ColorFilter.mode(
                      AppColors.primary.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Transform.rotate(
                    angle: 3.14,
                    child: SvgPicture.asset(
                      'assets/images/double_quotes.svg',
                      colorFilter: ColorFilter.mode(
                        AppColors.primary.withValues(alpha: 0.7),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 64.0,
                      vertical: 70.0,
                    ),
                    child: const Text(
                      'كن مستعدا في كل وقت وحين',
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontFamily: 'Cairo',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
