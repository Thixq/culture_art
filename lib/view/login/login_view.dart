import 'dart:ui';

import 'package:culture_art/view/login/login_components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 100.h,
              width: 90.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginForm(),
                  LoginFormButtons(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 95.h,
            left: 30.w,
            child: registerview(),
          )
        ],
      ),
    );
  }
}
