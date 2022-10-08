part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SignInState extends LoginState {}

class ValidateState extends LoginState {}
