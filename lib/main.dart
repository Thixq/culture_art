import 'package:culture_art/view/object_detail_view.dart';
import 'package:culture_art/view/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(CultureArt());
}

class CultureArt extends StatelessWidget {
  const CultureArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0XFF1c1c1c),
            scaffoldBackgroundColor: Color(0XFF2f2f2f),
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0XFF1c1c1c),
            ),
          ),
          home: Onboard(),
        );
      },
    );
  }
}
