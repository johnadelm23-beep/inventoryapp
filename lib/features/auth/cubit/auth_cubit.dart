import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> register({required String email, required String password, required String name,required String confirmPassword})async{
       emit(AuthLoadingState());
       try {
         final response = await AuthRepo.register(email: email, password: password, name: name, confirmPassword: confirmPassword);
         if(response){
           emit(AuthSuccessState());
         }else{
           emit(AuthErrorState(errorMessage: "حدث خطأ أثناء إنشاء الحساب"));
         }
       } catch (e) {
         emit(AuthErrorState(errorMessage: e.toString()));
       }
  }

  Future<void> login({required String email, required String password, })async{
    emit(AuthLoadingState());
    try {
      final response = await AuthRepo.login(email: email, password: password,);
      if(response){
        emit(AuthSuccessState());
      }else{
        emit(AuthErrorState(errorMessage: "البريد الإلكتروني أو كلمة المرور غير صحيحة"));
      }
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> signInWithGoogle()async{
    emit(AuthLoadingState());
    try {
      final response = await AuthRepo.signInWithGoogle();
      if(response){
        emit(AuthSuccessState());
      }else{
        emit(AuthErrorState(errorMessage: "فشل تسجيل الدخول بجوجل"));
      }
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }
}
