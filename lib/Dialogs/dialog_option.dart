import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Theme/assets.dart';
import '../Utils/app_config.dart';

// ignore: must_be_immutable
class OptionDialog extends StatefulWidget {
  String title, desc;

  OptionDialog({title, desc}){
    this.title = title;
    this.desc = desc;
  }

  @override
  _OptionDialogState createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context){
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.safeBlockHorizontal * 78,
          height: SizeConfig.safeBlockVertical * 28.86,
          padding: EdgeInsets.only(left: Constants.padding, right: Constants.padding
          ),

          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 12),),
            ],
          ),
        ),
      ],
    );
  }
}

class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}