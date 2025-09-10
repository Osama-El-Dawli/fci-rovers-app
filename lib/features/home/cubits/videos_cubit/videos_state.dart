part of 'videos_cubit.dart';

@immutable
sealed class VideosState {}

final class VideosInitial extends VideosState {}
final class VideosLoading extends VideosState {}
final class VideosSuccess extends VideosState {
  final List<VideoModel> videos;

  VideosSuccess({required this.videos});
}
final class VideosFailure extends VideosState {
  final String errMessage;

  VideosFailure({required this.errMessage});
}
