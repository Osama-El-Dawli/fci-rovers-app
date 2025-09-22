import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/core/widgets/custom_card.dart';
import 'package:fci_rovers_app/core/widgets/custom_title_widget.dart';
import 'package:fci_rovers_app/features/register/views/register_view_layout.dart';
import 'package:flutter/material.dart';

class JoinCard extends StatelessWidget {
  const JoinCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        final isMobile = maxWidth < 750;
        final isTablet = maxWidth >= 750 && maxWidth < 1200;

        double textFontSize;

        if (isMobile) {
          textFontSize = 14;
        } else if (isTablet) {
          textFontSize = 20;
        } else {
          textFontSize = 24;
        }
        return Row(
          children: [
            if (!isMobile) const Spacer(flex: 1),
            Expanded(
              flex: isMobile ? 1 : 8,
              child: CustomCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const CustomTitleWidget(title: 'انضم إلى عشيرة الجوالة'),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsetsGeometry.symmetric(
                          horizontal: 32,
                        ),
                        child: Text(
                          'علشان تكون جزء من كياننا وتعيش جو تاني وتكون جزء من نشاط مختلف وبتجربة فريدة من نوعها انضم لينا واستكشف حياة مختلفة ومغامرة جديدة في عشيرة الجوالة',
                          style: TextStyle(
                            height: 1.7,
                            color: AppColors.secondary,
                            fontSize: textFontSize,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterViewLayout(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (!isMobile) const Spacer(flex: 1),
          ],
        );
      },
    );
  }
}
