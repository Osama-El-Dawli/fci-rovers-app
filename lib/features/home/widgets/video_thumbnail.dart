import 'package:cached_network_image/cached_network_image.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/features/home/widgets/custom_video_player.dart';
import 'package:fci_rovers_app/features/home/widgets/error_card.dart';
import 'package:fci_rovers_app/features/home/widgets/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoThumbnail extends StatelessWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final int index;

  const VideoThumbnail({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: AppColors.background,
          barrierDismissible: false,
          useRootNavigator: true,
          context: context,
          builder: (context) => Stack(
            children: [
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 30,
                    color: AppColors.mutedForeground,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned.fill(child: CustomVideoPlayer(videoUrl: videoUrl)),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: thumbnailUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingCard(),
                errorWidget: (context, url, error) => const ErrorCard(),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primaryGlow,
                    AppColors.foreground,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/play.svg',
                  width: 50,
                  colorFilter: ColorFilter.mode(
                    AppColors.background,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
