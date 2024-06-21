import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color _white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
      primaryColor: primaryClr,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _white // Set the scaffold's background color
      );
  static final dark = ThemeData(
    primaryColor: darkHeaderClr,
    scaffoldBackgroundColor: darkHeaderClr,
    brightness: Brightness.dark, // Set the scaffold's background color
  );
}

TextStyle headingStyle(context) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
  ));
}

TextStyle subheadingStyle(context) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
  ));
}

TextStyle titleStyle(context) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
  ));
}

TextStyle subTitleStyle(context) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
  ));
}

TextStyle bodyStyle(context) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
  ));
}

TextStyle body2Style(context) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[200]
        : Colors.black,
  ));
}
