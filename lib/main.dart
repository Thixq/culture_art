import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/core/viewmodel/auth_viewmodel/auth_cubit.dart';
import 'package:culture_art/core/viewmodel/filter_viewmodel/filter_cubit.dart';
import 'package:culture_art/core/viewmodel/home_viewmodel/home_cubit.dart';
import 'package:culture_art/firebase_options.dart';
import 'package:culture_art/route/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Future.delayed(const Duration(milliseconds: 200));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeViewModelCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
      ],
      child: CultureArt(),
    ),
  );
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
          themeMode: ThemeMode.system,
          //home: Deneme(),
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
