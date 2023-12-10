import 'package:flutter/material.dart';
import 'app_constant.dart';

// convert to font weight
FontWeight convertToFontWeight({int weight = 400}) {
  switch (weight) {
    case 100:
      return FontWeight.w100;
    case 200:
      return FontWeight.w200;
    case 300:
      return FontWeight.w300;
    case 400:
      return FontWeight.w400;
    case 500:
      return FontWeight.w500;
    case 600:
      return FontWeight.w600;
    case 700:
      return FontWeight.w700;
    case 800:
      return FontWeight.w800;
    case 900:
      return FontWeight.w900;
    default:
      return FontWeight.normal;
  }
}

// Text Button
ButtonStyle textButtonStyle(
    BuildContext context,
    bool block,
    double width,
    double height,
    double fontSize,
    FontWeight fontWeight,
    Color color,
    double px,
    double py,
    double rounded) {
  return TextButton.styleFrom(
    foregroundColor: color,
    minimumSize: block ? Size.fromHeight(height) : Size(width, height),
    textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: AppConstants.defaultLetterSpacing),
    padding: EdgeInsets.symmetric(horizontal: px, vertical: py),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(rounded)),
    ),
  );
}

// Elevated Button
ButtonStyle elevatedButtonStyle(
    BuildContext context,
    bool block,
    double width,
    double height,
    double fontSize,
    FontWeight fontWeight,
    Color? color,
    Color? bgColor,
    double px,
    double py,
    double rounded,
    Color? shadowColor,
    double elevation) {
  return TextButton.styleFrom(
    foregroundColor: color,
    backgroundColor: bgColor,
    shadowColor: elevation == 0 ? Colors.transparent : shadowColor,
    elevation: elevation,
    minimumSize: block ? Size.fromHeight(height) : Size(width, height),
    textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: AppConstants.defaultLetterSpacing),
    padding: EdgeInsets.symmetric(horizontal: px, vertical: py),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(rounded)),
    ),
  );
}

// Outlined Button
ButtonStyle outlinedButtonStyle(
    BuildContext context,
    bool block,
    double width,
    double height,
    double fontSize,
    FontWeight fontWeight,
    Color color,
    Color bgColor,
    double px,
    double py,
    double rounded) {
  return TextButton.styleFrom(
    foregroundColor: color,
    backgroundColor: bgColor,
    shadowColor: Colors.transparent,
    minimumSize: block ? Size.fromHeight(height) : Size(width, height),
    textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: AppConstants.defaultLetterSpacing),
    padding: EdgeInsets.symmetric(horizontal: px, vertical: py),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(rounded)),
    ),
  );
}