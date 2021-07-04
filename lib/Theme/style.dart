import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  backgroundColor: Color(0xfff9f9f9),
  primaryColor: Color(0xff2d48c5),
  primaryColorLight: Color(0xff0dbaff),
  dividerColor: Colors.grey[100],
  hintColor: hintColor,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
    ),
      color: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white)),

  //text theme
  textTheme: TextTheme(
      //default text style of Text Widget
      bodyText1: TextStyle(color: scaffoldBackgroundColor),
      bodyText2: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(fontWeight: FontWeight.w500),
      headline3: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(letterSpacing: 2, fontSize: 16),
      caption: TextStyle(),
      overline: TextStyle(),
      button: TextStyle(color: scaffoldBackgroundColor, fontSize: 18)),
);

var linearGrad = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff2176c6),
      Color(0xff0dbaff),
    ],
    stops: [
      0.3,
      0.7
    ]);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
