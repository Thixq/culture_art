part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String error;
  AuthFailureState(this.error);
}

class SignInResetPasswordState extends AuthState {}
