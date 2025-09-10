import 'package:fci_rovers_app/core/widgets/custom_slider.dart';
import 'package:fci_rovers_app/core/widgets/custom_title_widget.dart';
import 'package:fci_rovers_app/features/home/cubits/videos_cubit/videos_cubit.dart';
import 'package:fci_rovers_app/features/home/models/video_model.dart';
import 'package:fci_rovers_app/features/home/widgets/error_card.dart';
import 'package:fci_rovers_app/features/home/widgets/loading_card.dart';
import 'package:fci_rovers_app/features/home/widgets/video_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<VideosCubit, VideosState>(
          builder: (context, state) {
            if (state is VideosSuccess) {
              return CustomSlider<VideoModel>(
                items: state.videos,
                itemBuilder: (context, item, index) {
                  return VideoThumbnail(
                    videoUrl: item.videoUrl,
                    thumbnailUrl: item.thumbnailUrl,
                    index: index,
                  );
                },
              );
            } else if (state is VideosFailure) {
              CustomSlider(
                items: [1, 2, 3],
                itemBuilder: (context, item, index) => ErrorCard(),
              );
            } else {
              return CustomSlider(
                items: [1, 2, 3],
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: LoadingCard(),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
