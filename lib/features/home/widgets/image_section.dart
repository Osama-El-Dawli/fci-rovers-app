import 'package:cached_network_image/cached_network_image.dart';
import 'package:fci_rovers_app/core/widgets/custom_title_widget.dart';
import 'package:fci_rovers_app/core/widgets/custom_slider.dart';
import 'package:fci_rovers_app/features/home/widgets/error_card.dart';
import 'package:fci_rovers_app/features/home/widgets/loading_card.dart'
    show LoadingCard;
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomTitleWidget(title: 'معرض الصور'),
        SizedBox(height: isMobile ? 24 : 45),
        CustomSlider(
          items: [
            'https://static.vecteezy.com/system/resources/previews/005/741/500/non_2x/happy-girl-scouts-set-collection-free-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/005/741/500/non_2x/happy-girl-scouts-set-collection-free-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/005/741/500/non_2x/happy-girl-scouts-set-collection-free-vector.jpg',
          ],
          itemBuilder: (context, item, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: WidgetZoom(
                heroAnimationTag: 'gallery_image_$index',
                zoomWidget: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: item,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => LoadingCard(),
                      errorWidget: (context, url, error) => ErrorCard(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
