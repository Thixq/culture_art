import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:culture_art/core/viewmodel/auth_viewmodel/auth_cubit.dart';
import 'package:culture_art/route/routes.dart';
import 'package:culture_art/view/login/login_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.homeView, (route) => false);
          } else if (state is AuthFailureState) {
            var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error!',
                message: state.error,
                contentType: ContentType.failure,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is SignInResetPasswordState) {
            var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Success!',
                message: 'Check your e-mail address.',
                contentType: ContentType.success,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              _buildTitle(context),
              _buildForm(),
              _buildRegisterViewDirection()
            ],
          );
        },
      ),
    );
  }

  Positioned _buildRegisterViewDirection() {
    return Positioned(
      top: 95.h,
      child: const RegisterViewDirection(),
    );
  }

  Positioned _buildTitle(BuildContext context) {
    return Positioned(
      top: 20.h,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        width: 100.w,
        child: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 28.sp),
        ),
      ),
    );
  }

  Positioned _buildForm() {
    return Positioned(
      top: 10.sp,
      child: Container(
        alignment: Alignment.center,
        height: 100.h,
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            LoginForm(),
            LoginFormButtons(),
          ],
        ),
      ),
    );
  }
}
