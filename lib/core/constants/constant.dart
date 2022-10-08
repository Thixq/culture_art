import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Constant {
// Constant İnt
  static const int kInt = 64;
  //TextStyle
  static final TextStyle objectArtistTitleStyle = GoogleFonts.roboto(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white);
  static final TextStyle objectArtTitleStyle = GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(211, 255, 255, 255));
  static final TextStyle objectArtDescriptionStyle = GoogleFonts.roboto(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.white70);
  static final TextStyle objectInfoDetailTitleStyle = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white);
  static final TextStyle objectInfoDetailDescriptionStyle = GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(211, 255, 255, 255));

  static TextStyle _textStyle(
      {required int fontSize,
      required FontWeight fontWeight,
      required Color color}) {
    return GoogleFonts.roboto(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  // SizedBox
  static SizedBox sizedBox = SizedBox(height: 12.sp);

  static ThemeData darkTheme() => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
            elevation: 5,
            minimumSize: Size(275, 45),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white70,
        ),
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: Colors.white,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade500, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade500, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade500, width: 2.5),
          ),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0XFF2f2f2f),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF1c1c1c),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.roboto(
              fontSize: 23.5.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          headlineMedium: GoogleFonts.roboto(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          titleMedium: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          bodyMedium: GoogleFonts.roboto(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70),
          bodySmall: GoogleFonts.roboto(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70),
        ),
      );

  static ThemeData themeData() => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
            elevation: 0,
            minimumSize: Size(275, 45),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black87,
        ),
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: Colors.black,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade500, width: 2.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade500, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black87, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black87, width: 2.5),
          ),
        ),
        brightness: Brightness.light,
        primaryColor: Color(0xff1c1c1c),
        appBarTheme: AppBarTheme(color: Colors.grey.shade300),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.roboto(
              fontSize: 23.5.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          headlineMedium: GoogleFonts.roboto(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          titleMedium: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          bodyMedium: GoogleFonts.roboto(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
          bodySmall: GoogleFonts.roboto(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
        ),
      );
}
