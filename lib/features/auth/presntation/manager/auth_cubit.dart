import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  bool login=true;
  final AutheRepo authRepo;
  String? account, userId;

  void changeMode(){
    login=!login;
    emit(AuthInitial());
  }

  Future<void> authFun({required String email,required String password}) async {
      emit(AuthLoading());
      var res = await authRepo.Authentication(email: email, password: password, login: login);
      res.fold((failure) {
        emit(AuthFailure(failure.errorMessage));
      }, (accountDataMap) {
        account=accountDataMap['account'];
        userId=accountDataMap['userId'];

        emit(AuthSuccess());
      });
  }

}