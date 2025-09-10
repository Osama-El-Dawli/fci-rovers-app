part of 'images_cubit.dart';

@immutable
sealed class ImagesState {}

final class ImagesInitial extends ImagesState {}

final class ImagesLoading extends ImagesState {}

final class ImageSuccess extends ImagesState {
  final List<String> images;

  ImageSuccess({required this.images});
}

final class ImagesFailure extends ImagesState {
  final String errMessage;

  ImagesFailure({required this.errMessage});
}
