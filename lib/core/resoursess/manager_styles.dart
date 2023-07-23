import 'package:flutter/material.dart';

import 'manager_fonts.dart';

TextStyle _textStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required TextDecoration decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: ManagerFontFamily.fontFamily,
    fontWeight: ManagerFontWeight.regular,
    color: color,
    decoration: decoration,
  );
}

TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: ManagerFontFamily.fontFamily,
    fontWeight: ManagerFontWeight.bold,
    color: color,
    decoration: decoration,
  );
}

TextStyle getMediumTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: ManagerFontFamily.fontFamily,
    fontWeight: ManagerFontWeight.medium,
    color: color,
    decoration: decoration,
  );
}

TextStyle getTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  FontWeight? weight,
}) {
  return _textStyle(
    fontSize: fontSize,
    fontFamily: ManagerFontFamily.fontFamily,
    fontWeight: weight ?? ManagerFontWeight.medium,
    color: color,
    decoration: decoration,
  );
}
