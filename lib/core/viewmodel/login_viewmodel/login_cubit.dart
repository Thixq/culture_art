import 'package:bloc/bloc.dart';
import 'package:culture_art/core/services/auth_services/Iauth_services.dart';
import 'package:culture_art/core/services/auth_services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final IAuthServices _authServices =
      FirebaseAuthServices(auth: FirebaseAuth.instance);

  void SignIn(
      {required GlobalKey<FormState> formkey,
      required TextEditingController email,
      required TextEditingController password}) {
    if (formkey.currentState!.validate()) {
      _authServices
          .signIn(email: email.text, password: password.text)
          .then((value) {
        debugPrint(value.toString());
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
  }
}
