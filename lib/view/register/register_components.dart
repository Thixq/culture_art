import 'package:culture_art/core/viewmodel/auth_viewmodel/auth_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
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
              const SizedBox(
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
              const SizedBox(
                height: 5,
              ),
              const PasswordWidget(),
            ],
          ),
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

class RegisterFormButtons extends StatelessWidget {
  const RegisterFormButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            context.read<AuthCubit>().SignUp(
                formkey: registerFormKey,
                email: emailController,
                password: passwordController);
          },
          child: const Text('Sign Up'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthCubit>().GoogleSignIns();
          },
          child: const Text('Sign Up with Goolge'),
        ),
      ],
    );
  }
}

class LoginViewDirection extends StatelessWidget {
  const LoginViewDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        emailController.clear();
        passwordController.clear();
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: 210,
        height: 20.sp,
        child: RichText(
          text: TextSpan(
            text: 'I already have an account',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: ' sign in!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
