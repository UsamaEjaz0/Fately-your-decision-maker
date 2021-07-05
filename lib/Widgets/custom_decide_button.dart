import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Utils/app_config.dart';
import '../Theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haha_decision_maker/Theme/assets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;

  CustomButton(this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Align(
          alignment: Alignment(0, 0),
          child: Image.asset(
            Assets.buttonTexture,
            width: SizeConfig.safeBlockHorizontal * 95,
            height: SizeConfig.safeBlockHorizontal * 10,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 95,
            height: SizeConfig.safeBlockHorizontal * 11,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.black.withOpacity(0.4);
                  },
                ),
              ),
              onPressed: () {
                onTap();
              },
              child: Text(this.text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),

              ),
            ),
          ),
        ),
      ],
    );
  }
}
