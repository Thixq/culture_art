import 'package:culture_art/route/routes.dart';
import 'package:culture_art/view/onboard/onboard_view.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 4000), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.onboardView, (route) => false);
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Scaffold(
      body: Center(
          child: AspectRatio(
        aspectRatio: 1,
        child: Lottie.asset('assets/splashview/splashlottie.json',
            controller: _animationController),
      )),
    );
  }
}
