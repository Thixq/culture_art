import 'package:culture_art/view/home/home_view.dart';
import 'package:culture_art/view/login/login_view.dart';
import 'package:culture_art/view/object_detail/object_detail_view.dart';
import 'package:culture_art/view/onboard/onboard_view.dart';
import 'package:culture_art/view/register/register_view.dart';
import 'package:culture_art/view/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String splashView = '/';
  static const String onboardView = '/onboardview';
  static const String loginView = '/loginview';
  static const String registerView = '/registerview';
  static const String homeView = '/homeview';
  static const String objectDetialView = '/objectdetialview';
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashView:
        return routeIf(settings, SplashView());
      case RouteNames.onboardView:
        return routeIf(settings, OnboardView());
      case RouteNames.loginView:
        return routeIf(settings, LoginView());
      case RouteNames.registerView:
        return routeIf(settings, RegisterView());
      case RouteNames.homeView:
        return routeIf(settings, HomeView());
      case RouteNames.objectDetialView:
        return routeIf(settings, ObjectDetailView());
    }
  }

  static Route<dynamic>? routeIf(RouteSettings settings, Widget view) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => view,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => view,
      );
    } else {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => view,
      );
    }
  }
}
