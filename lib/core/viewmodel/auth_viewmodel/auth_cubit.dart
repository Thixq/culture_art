// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:culture_art/core/services/auth_services/Iauth_services.dart';
import 'package:culture_art/core/services/auth_services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
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
        email.clear();
        password.clear();
        emit(AuthSuccessState());
      }).catchError((error) {
        password.clear();
        var errorMessage = error.toString();
        emit(AuthFailureState(errorMessage));
      });
    }
  }

  void GoogleSignIns() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().catchError((onError) {});
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        emit(AuthSuccessState());
      });
      FirebaseAuth _asd = FirebaseAuth.instance;
    }
  }

  void SignUp(
      {required GlobalKey<FormState> formkey,
      required TextEditingController email,
      required TextEditingController password}) {
    if (formkey.currentState!.validate()) {
      _authServices
          .signUp(email: email.text, password: password.text)
          .then((value) {
        email.clear();
        password.clear();
        emit(AuthSuccessState());
      }).catchError((onError) {
        var errorMessage = onError.toString();
        emit(AuthFailureState(errorMessage));
      });
    }
  }

  void ResetPassword({
    required GlobalKey<FormState> formkey,
    required TextEditingController email,
  }) async {
    debugPrint(email.text);
    if (formkey.currentState!.validate()) {
      _authServices.passwordReset(email: email.text).then((value) {
        email.clear();
        emit(SignInResetPasswordState());
        debugPrint(value.toString());
      }).catchError((onError) {
        debugPrint(onError.toString());
        emit(AuthFailureState(onError));
      });
    }
  }
}
