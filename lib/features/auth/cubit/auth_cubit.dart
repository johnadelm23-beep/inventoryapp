import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> register({required String email, required String password, required String name,required String confirmPassword})async{

       emit(AuthLoadingState());
        final response = await AuthRepo.register(email: email, password: password, name: name, confirmPassword: confirmPassword);

          if(response){
            emit(AuthSuccessState());
          }else{
            emit(AuthErrorState());
          }





  }

  Future<void> login({required String email, required String password, })async{

    emit(AuthLoadingState());
    final response = await AuthRepo.login(email: email, password: password,);

    if(response){
      emit(AuthSuccessState());
    }else{
      emit(AuthErrorState());
    }





  }

  Future<void> signInWithGoogle()async{
    emit(AuthLoadingState());
    final response = await AuthRepo.signInWithGoogle();
              if(response){
            emit(AuthSuccessState());
          }else{
            emit(AuthErrorState());

              }

  }

}
