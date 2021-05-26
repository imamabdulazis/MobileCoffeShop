import 'package:flutter/material.dart';

const largeText = 22.0;
const buttonText = 18.0;
const mediumText = 16.0;
const regularText = 14.0;
const smallText = 12.0;

const greyLine = Color(0xFFE2E2E2);
const textDarkGrey = Color(0xFF757575);
const textGrey = Color(0xFFD6D4D4);

const primaryDark = Color(0xFF71237D);
const primaryColor = Color(0xFF591571);
const orangePrimary = Color(0xFFF6A762);

const greenIcon = Color(0xFF6FC179);

const String myFont = 'Montserrat';

class MyFont {
  static const Headline1TextStyle = TextStyle(
      fontFamily: myFont,
      fontSize: largeText,
      fontWeight: FontWeight.w700,
      color: Colors.white);

  static const Headline3TextStyle = TextStyle(
      fontFamily: myFont,
      fontSize: buttonText,
      fontWeight: FontWeight.w700,
      color: primaryDark);

  static const Headline5TextStyle = TextStyle(
      fontFamily: myFont,
      fontSize: mediumText,
      fontWeight: FontWeight.w700,
      color: textDarkGrey);

  static const Headline6TextStyle = TextStyle(
      fontFamily: myFont,
      fontSize: regularText,
      fontWeight: FontWeight.w700,
      color: textDarkGrey);

  static const Body1TextStyle =
      TextStyle(fontFamily: myFont, fontSize: regularText, color: textDarkGrey);

  static const Body2TextStyle =
      TextStyle(fontFamily: myFont, fontSize: regularText, color: textGrey);

  static const CaptionTextStyle =
      TextStyle(fontFamily: myFont, fontSize: smallText, color: textGrey);

  static const ButtonTextStyle = TextStyle(
      fontFamily: myFont,
      fontSize: mediumText,
      fontWeight: FontWeight.w600,
      color: Colors.white);
}
