import 'package:culture_art/route/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late FirebaseAuth _firebaseAuth;
  @override
  void initState() {
    super.initState();
    _firebaseAuth = FirebaseAuth.instance;
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (_firebaseAuth.currentUser == null) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.onboardView, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.homeView, (route) => false);
          }
        }
      });
  }

  @override
  void dispose() {
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
