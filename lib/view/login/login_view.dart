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
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}
