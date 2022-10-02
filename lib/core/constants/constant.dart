import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Constant {
// Constant İnt
  static const int kInt = 64;
  //TextStyle
  static final TextStyle ObjectArtistTitleStyle = GoogleFonts.roboto(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white);
  static final TextStyle ObjectArtTitleStyle = GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(211, 255, 255, 255));
  static final TextStyle ObjectArtDescriptionStyle = GoogleFonts.roboto(
      fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.white70);
  static final TextStyle ObjectInfoDetailTitleStyle = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white);
  static final TextStyle ObjectInfoDetailDescriptionStyle = GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(211, 255, 255, 255));
  // SizedBox
  static SizedBox sizedBox = SizedBox(height: 12.sp);
}
