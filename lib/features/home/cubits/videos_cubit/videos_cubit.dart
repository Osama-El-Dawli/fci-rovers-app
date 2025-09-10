import 'package:bloc/bloc.dart';
import 'package:fci_rovers_app/features/home/models/video_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosInitial());

  Future<void> getVideos() async {
    final supabase = Supabase.instance.client;
    try {
      emit(VideosLoading());

      final response = await supabase.storage.from('videos').list();
      final videoFiles = response
          .where(
            (file) => file.name != 'thumbnails' && file.name.endsWith('.mp4'),
          )
          .toList();

      final videos = <VideoModel>[];

      for (final video in videoFiles) {
        final videoUrl = await supabase.storage
            .from('videos')
            .createSignedUrl(video.name, 60 * 60);

        final videoNameWithoutExt = video.name.replaceAll('.mp4', '');
        final thumbnailUrl = await supabase.storage
            .from('videos')
            .createSignedUrl('thumbnails/$videoNameWithoutExt.png', 60 * 60);

        videos.add(VideoModel(videoUrl: videoUrl, thumbnailUrl: thumbnailUrl));
      }

      emit(VideosSuccess(videos: videos));
    } catch (e) {
      emit(VideosFailure(errMessage: e.toString()));
    }
  }
}
