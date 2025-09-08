import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_button.dart';
import 'package:fci_rovers_app/core/widgets/custom_card.dart';
import 'package:fci_rovers_app/features/register/views/register_view_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuoteBox extends StatelessWidget {
  const QuoteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        final isMobile = maxWidth < 750;
        final isTablet = maxWidth >= 750 && maxWidth < 1200;

        double containerPaddingHorizontal;
        double containerPaddingVertical;
        double quoteFontSize;
        double quoteLineHeight;
        double svgSize;
        double buttonTopSpacing;

        if (isMobile) {
          containerPaddingHorizontal = 20;
          containerPaddingVertical = 40;
          quoteFontSize = 18;
          quoteLineHeight = 1.3;
          svgSize = 20;
          buttonTopSpacing = 28;
        } else if (isTablet) {
          containerPaddingHorizontal = 40;
          containerPaddingVertical = 50;
          quoteFontSize = 24;
          quoteLineHeight = 1.4;
          svgSize = 30;
          buttonTopSpacing = 32;
        } else {
          containerPaddingHorizontal = 60;
          containerPaddingVertical = 60;
          quoteFontSize = 28;
          quoteLineHeight = 1.5;
          svgSize = 40;
          buttonTopSpacing = 34;
        }

        return Row(
          children: [
            if (!isMobile) const Spacer(flex: 1),
            Expanded(
              flex: isMobile ? 1 : 8,
              child: CustomCard(
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right: 10,
                      child: SvgPicture.asset(
                        'assets/images/double_quotes.svg',
                        width: svgSize,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary.withValues(alpha: 0.7),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Transform.rotate(
                        angle: 3.14,
                        child: SvgPicture.asset(
                          'assets/images/double_quotes.svg',
                          width: svgSize,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary.withValues(alpha: 0.7),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: containerPaddingHorizontal,
                          vertical: containerPaddingVertical,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'كن مستعدا في كل وقت وحين',
                              textAlign: isMobile
                                  ? TextAlign.center
                                  : TextAlign.left,
                              style: TextStyle(
                                color: AppColors.foreground,

                                fontSize: quoteFontSize,
                                height: quoteLineHeight,
                              ),
                            ),
                            SizedBox(height: buttonTopSpacing),
                            CustomButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterViewLayout(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
