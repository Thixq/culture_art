import 'package:culture_art/core/services/auth_services/firebase_auth_services.dart';
import 'package:culture_art/core/viewmodel/login_viewmodel/login_cubit.dart';
import 'package:culture_art/route/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'E-Mail',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (EmailValidator.validate(value)) {
                      return null;
                    } else {
                      return 'Please enter a valid e-mail.';
                    }
                  } else {
                    return 'Please enter your e-mail.';
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Password',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              PasswordWidget(),
            ],
          ),
          PasswordReset(),
        ],
      ),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: isVisibility,
      enableSuggestions: false,
      autocorrect: false,
      validator: (value) {
        if (value!.isNotEmpty) {
          return null;
        } else {
          return 'Please enter your password.';
        }
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isVisibility = !isVisibility;
            });
          },
          icon: Icon(isVisibility ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}

class LoginFormButtons extends StatelessWidget {
  const LoginFormButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            context.read<LoginCubit>().SignIn(
                formkey: formKey,
                email: emailController,
                password: passwordController);
          },
          child: const Text('Sign in'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign in with Goolge'),
        ),
        ElevatedButton(
          onPressed: () {
            FirebaseAuthServices _authServices =
                FirebaseAuthServices(auth: FirebaseAuth.instance);
            _authServices.signOut().then((value) {
              debugPrint(value.toString());
            });
          },
          child: const Text('Sign in with Apple'),
        ),
      ],
    );
  }
}

class PasswordReset extends StatelessWidget {
  const PasswordReset({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: 108,
        height: 40,
        child: Text(
          'Password Reset',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class registerview extends StatelessWidget {
  const registerview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.registerView);
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: 200,
        height: 20.sp,
        child: RichText(
          text: TextSpan(
            text: 'Don\'t have an account?',
            style: GoogleFonts.roboto(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                  text: ' sign up',
                  style: GoogleFonts.roboto(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }
}
