import 'package:fci_rovers_app/core/consts/app_consts.dart';
import 'package:fci_rovers_app/core/widgets/custom_slider.dart';
import 'package:fci_rovers_app/core/widgets/custom_title_widget.dart';
import 'package:fci_rovers_app/features/home/widgets/video_thumbnail.dart';
import 'package:flutter/material.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Column(
      children: [
        const CustomTitleWidget(title: 'الفيديوهات'),
        SizedBox(height: isMobile ? 24 : 45),
        CustomSlider<Map<String, String>>(
          items: AppConsts.videos,
          itemBuilder: (context, item, index) {
            return VideoThumbnail(
              videoUrl: item['videoUrl']!,
              thumbnailUrl: item['thumbnailUrl']!,
              index: index,
            );
          },
        ),
      ],
    );
  }
}
