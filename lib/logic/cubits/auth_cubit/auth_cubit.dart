import 'package:cargo_linker/data/repositories/auth_repository.dart';
import 'package:cargo_linker/data/repositories/company_repository.dart';
import 'package:cargo_linker/logic/cubits/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final _authRepository = AuthRepository();
  final _companyRepository = CompanyRepository();

  void authCheck() async {
    try {
      emit(AuthLoadingState());
      await _authRepository.getUser();
      emit(AuthLoggedInState());
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }

  void emailVerify(String email) async {
    try {
      emit(AuthLoadingState());
      await _companyRepository.companyEmailVerify(email);
      emit(AuthOTPVerificationState());
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }

  void signup(String email, String password, String otp) async {
    try {
      emit(AuthLoadingState());
      await _companyRepository.companySignup(email, password, otp);
      emit(AuthLoggedInState());
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }

  void login(String email, String password) async {
    try {
      emit(AuthLoadingState());
      await _companyRepository.companyLogin(email, password);
      emit(AuthLoggedInState());
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }

  void logout() async {
    try {
      emit(AuthLoadingState());
      await _authRepository.logoutUser();
      emit(AuthLoggedOutState());
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }
}
