import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Utils/app_config.dart';
import '../Theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haha_decision_maker/Theme/assets.dart';

class CustomNameText extends StatelessWidget {
  final fontSize;

  CustomNameText({this.fontSize});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RichText(
      text: TextSpan(
        text: 'FATE',
        style: TextStyle(
          fontFamily: "Montserrat",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: this.fontSize,
          color: Colors.white,
        ),
        children:  <TextSpan>[
          TextSpan(
              text: 'ly',
              style: TextStyle(
            fontFamily: "Blacksword",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: this.fontSize,
            color: Colors.white,
          )),
        ],


      ),
    );
  }
}
