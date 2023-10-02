abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}

class AuthOTPVerificationState extends AuthState {
  final bool isResend;
  AuthOTPVerificationState({this.isResend = false});
}

class AuthLoggedInState extends AuthState {}

class AuthLoggedOutState extends AuthState {}
