import 'package:culture_art/view/register/register_components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildTitle(context),
          _buildForm(),
          _buildLoginViewDirection()
        ],
      ),
    );
  }

  Positioned _buildLoginViewDirection() =>
      Positioned(top: 95.h, child: const LoginViewDirection());

  Positioned _buildTitle(BuildContext context) {
    return Positioned(
      top: 20.h,
      child: Container(
        margin: const EdgeInsets.only(left: 30),
        width: 100.w,
        child: Text(
          'Sign Up',
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
      top: 25.h,
      child: Container(
        alignment: Alignment.center,
        height: 45.h,
        width: 90.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RegisterForm(),
            SizedBox(height: 20),
            RegisterFormButtons(),
          ],
        ),
      ),
    );
  }
}
