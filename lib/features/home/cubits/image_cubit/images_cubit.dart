import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());
  final supabase = Supabase.instance.client;

  Future<void> getImages() async {
    emit(ImagesLoading());

    try {
      final response = await supabase.storage.from('images').list();

      final urls = await Future.wait(
        response.map((file) async {
          final signedUrl = await supabase.storage
              .from('images')
              .createSignedUrl(file.name, 60 * 60);
          return signedUrl;
        }),
      );

      emit(ImageSuccess(images: urls));
    } catch (e) {
      emit(ImagesFailure(errMessage: e.toString()));
    }
  }
}
