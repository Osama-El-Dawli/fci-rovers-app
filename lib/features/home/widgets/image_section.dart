import 'package:cached_network_image/cached_network_image.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/core/widgets/custom_tile_widget.dart';
import 'package:fci_rovers_app/core/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTileWidget(title: 'معرض الصور'),
        SizedBox(height: 45),
        CustomSlider(
          items: [
            'https://static.vecteezy.com/system/resources/previews/005/741/500/non_2x/happy-girl-scouts-set-collection-free-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/005/741/500/non_2x/happy-girl-scouts-set-collection-free-vector.jpg',
            'https://static.vecteezy.com/system/resources/previews/005/741/500/non_2x/happy-girl-scouts-set-collection-free-vector.jpg',
          ],
          itemBuilder: (context, item, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.card,
                  highlightColor: AppColors.border.withValues(alpha: 0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.card, AppColors.muted],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.error,
                      size: 65,
                      color: AppColors.primary,
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
