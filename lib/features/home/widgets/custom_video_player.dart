import 'package:chewie/chewie.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  CustomVideoPlayerState createState() => CustomVideoPlayerState();
}

class CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );

    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((
      _,
    ) {
      _chewieController = ChewieController(
        customControls: const Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialControls(),
        ),
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: false,
        aspectRatio: 16 / 9,
        allowFullScreen: true,
        allowMuting: true,
        showControlsOnInitialize: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primaryGlow,
          backgroundColor: AppColors.foreground.withValues(alpha: 0.3),
          handleColor: AppColors.mutedForeground,
        ),
        errorBuilder: (context, errorMessage) {
          return const Center(
            child: Icon(Icons.error, color: AppColors.primary, size: 50),
          );
        },
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: Chewie(controller: _chewieController),
            );
          } else {
            return Center(
              child: RepaintBoundary(
                child: LottieBuilder.asset(
                  'assets/images/fire_loading.json',
                  width: 200,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
