import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/route/routes.dart';
import 'package:culture_art/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 2));
  runApp(CultureArt());
}

class CultureArt extends StatelessWidget {
  const CultureArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'CultureArt',
          darkTheme: Constant.darkTheme(),
          debugShowCheckedModeBanner: false,
          theme: Constant.themeData(),
          themeMode: ThemeMode.dark,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
