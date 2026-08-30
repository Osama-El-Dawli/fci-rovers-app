import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
        ),
        color: AppColors.muted.withValues(alpha: 0.3),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () async {
              final Uri url = Uri.parse(
                'https://www.facebook.com/7asebattanta/',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.facebook, color: AppColors.secondary, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'تابعنا على فيسبوك',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.foreground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'جميع الحقوق محفوظة © 2026',
            style: TextStyle(fontSize: 15, color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
