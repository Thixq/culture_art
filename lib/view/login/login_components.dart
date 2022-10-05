import 'package:culture_art/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.h,
      width: 90.w,
      child: Form(
        key: formKey,
        child: Column(
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
                SizedBox(
                  height: 58,
                  child: TextFormField(),
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
                SizedBox(
                  height: 58,
                  child: TextFormField(),
                ),
              ],
            ),
            LoginFormButtons(),
          ],
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
        GestureDetector(
          onTap: () {
            debugPrint('asd');
          },
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
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign in'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign in with Goolge'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign in with Apple'),
        ),
        const registerview(),
      ],
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
