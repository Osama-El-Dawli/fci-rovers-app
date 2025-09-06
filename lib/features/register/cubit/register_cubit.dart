import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fci_rovers_app/features/register/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser({required UserModel user}) async {
    try {
      emit(RegisterLoading());

      await Supabase.instance.client.from('users').insert(user.toJson());

      emit(RegisterSuccess());
    } on PostgrestException catch (e) {
      if (e.code == '23505') {
        emit(RegisterFailure(errorMessage: 'المستخدم مسجل بالفعل'));
      } else {
        emit(RegisterFailure(errorMessage: e.message));
      }
    } on SocketException {
      emit(RegisterFailure(errorMessage: 'تأكد من اتصالك بالإنترنت'));
    } on TimeoutException {
      emit(RegisterFailure(errorMessage: 'انتهت مهلة الاتصال، حاول مرة أخرى'));
    } on FormatException {
      emit(RegisterFailure(errorMessage: 'خطأ في معالجة البيانات'));
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'حدث خطأ غير متوقع: $e'));
    }
  }
}
